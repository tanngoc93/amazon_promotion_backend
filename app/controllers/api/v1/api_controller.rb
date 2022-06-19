class Api::V1::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate!

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def array_json(collection, serializer)
    ActiveModel::Serializer::CollectionSerializer.new(
      collection, serializer: serializer
    )
  end

  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages
    }.merge(extra_meta)
  end

  protected

    def authenticate!
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_user = User.find_by(access_token: token)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: { message: 'Bad credentials' }, status: :unauthorized
    end
end