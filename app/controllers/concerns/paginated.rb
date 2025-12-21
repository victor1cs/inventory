module Paginated
  extend ActiveSupport::Concern

  def paginate_collection(collection, default_per_page: 10)
    per_page = params[:per_page]&.to_i || default_per_page
    per_page = [ 10, 20, 50 ].include?(per_page) ? per_page : default_per_page

    @per_page = per_page
    collection.page(params[:page]).per(per_page)
  end

  def pagination_params
    {
      per_page: @per_page,
      page: params[:page]
    }
  end
end
