module Devise::Strategies
  class HerokuSso < Authenticatable
    def valid?
      valid_token? && !token_expired?
    end

    def authenticate!

    end

    private

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
