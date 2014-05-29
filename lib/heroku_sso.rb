require 'devise/strategies/authenticatable'

module HerokuSso
  class CustomStrategy < Devise::Strategies::Authenticatable
    def valid?
      valid_token? && !token_expired?
    end

    def authenticate!
      resource = mapping.to.find_for_authentication(:id => id)
      return authentication_result_for resource
    end

    private

    def authentication_result_for resource
      resource ? success_authentication(resource) : fail!
    end

    def success_authentication resource
      cookies['heroku-nav-data'] = { :value => params['nav-data'],
                                     :path => '/' ,
                                     :expires => 24.hours.from_now  }
      success!(resource)
    end

    def id
      params[:id].to_i
    end

    def pre_token
      "#{params[:id]}:#{ENV['HEROKU_SSO_SALT']}:#{params[:timestamp]}"
    end

    def token
      Digest::SHA1.hexdigest(pre_token).to_s
    end

    def valid_token?
      token == params[:token]
    end

    def token_expired?
      params[:timestamp].to_i < (Time.now - 2.minutes).to_i
    end
  end
end

Warden::Strategies.add(:heroku_sso, HerokuSso::CustomStrategy)
Devise.add_module :heroku_sso, :strategy => true

