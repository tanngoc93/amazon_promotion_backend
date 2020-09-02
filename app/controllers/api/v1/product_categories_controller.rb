class Api::V1::ProductCategoriesController < Api::V1::ApiController
  skip_before_action :authenticate!, only: [:index]

  def index
    categories = ProductCategory.where(enable: true).order(name: :asc)

    render json: {
      categories: categories
    }, status: 200
  end
end
