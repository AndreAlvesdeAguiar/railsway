module Api
  module V1
    class TokensController < Api::ApiController
      before_action :check_token_expiration, only: :token

      # GET api/v1/tokens
      def token
        render json: { token: @token.key, expiration: @token.expiration.strftime("%d/%m/%Y - %H:%M:%S") }
      end

      private

      def generate_token
        @token = Token.create(
          key: SecureRandom.base64(150),
          expiration: 1.day.from_now
        )
      end

      def check_token_expiration
        return generate_token if Token.count == 0

        if Token.last.expired?
          Token.last.destroy

          generate_token
        else
          @token = Token.last
        end
      end
    end
  end
end
