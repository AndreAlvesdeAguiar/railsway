module Api
  class ApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    def authenticate_token!
      authenticate_or_request_with_http_token do |token, options|
        token = Token.all.select { |t| ActiveSupport::SecurityUtils.secure_compare(t.key, token) }

        return if token.present?

        render(
          json: { successful: false, error: I18n.t("token.invalid_token") },
          status: :unauthorized
        )
      end
    end

    def pagination_meta(paginated_collection)
      paginated_collection.reload
      {
        pagination: {
          per_page: 100,
          current_page: paginated_collection.current_page,
          last: paginated_collection.total_pages,
          next: paginated_collection.next_page,
          prev: paginated_collection.prev_page,
          total_count: paginated_collection.total_count
        }
      }
    end
  end
end
