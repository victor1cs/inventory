module ProductFilterable
  extend ActiveSupport::Concern

  included do
    include Paginated
    include Filterable
  end

  private

  def apply_product_filters(base_collection)
    collection = base_collection.includes(:category).order(created_at: :desc)

    # Aplicar busca por nome
    collection = apply_name_search(collection)

    # Aplicar filtro de status
    collection = apply_status_filter(collection, status_column: :status, default_filter: "in_stock")

    # Aplicar paginação
    paginate_collection(collection, default_per_page: 10)
  end

  def apply_name_search(collection)
    search_term = params[:search]
    @search_term = search_term

    if search_term.present?
      collection = collection.where("products.name ILIKE ?", "%#{search_term}%")
    end

    collection
  end
end
