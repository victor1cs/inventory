class ProductsController < ApplicationController
  include ProductFilterable

  before_action :authenticate_user!
  before_action :set_product, only: [ :show, :edit, :update, :destroy, :sell ]

  def index
    @products = apply_product_filters(Product.all)
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @categories = Category.all

    if @product.save
      redirect_to @product, notice: "Produto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @categories = Category.all

    if @product.update(product_params)
      redirect_to @product, notice: "Produto atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def sell
    service = ::ProductSaleService.new(@product)

    if service.call
      redirect_to products_path(filter_params), notice: "Produto vendido com sucesso!"
    else
      redirect_to products_path(filter_params), alert: service.errors.join(", ")
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path(filter_params), notice: "Produto removido com sucesso!"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :color, :storage, :battery_percentage, :condition, :status, :price, :description, :category_id)
  end
end
