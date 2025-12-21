module Filterable
  extend ActiveSupport::Concern

  included do
    helper_method :filter_params
  end

  def apply_status_filter(collection, status_column: :status, default_filter: "in_stock")
    filter = params[:status_filter] || default_filter

    case filter
    when "in_stock"
      collection = collection.public_send(:in_stock) if collection.respond_to?(:in_stock)
    when "sold"
      collection = collection.public_send(:sold) if collection.respond_to?(:sold)
    when "all"
      # Não aplica filtro, retorna todos
    end

    @status_filter = filter
    collection
  end

  def filter_params
    {
      search: @search_term,
      status_filter: @status_filter,
      per_page: @per_page,
      page: params[:page]
    }.compact
  end
end
