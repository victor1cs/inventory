class ProductSaleService
  attr_reader :product, :errors

  def initialize(product)
    @product = product
    @errors = []
  end

  def call
    return false unless valid?

    if @product.update(status: :sold)
      true
    else
      @errors = @product.errors.full_messages
      false
    end
  end

  def success?
    @errors.empty?
  end

  private

  def valid?
    if @product.nil?
      @errors << "Produto não encontrado"
      return false
    end

    unless @product.in_stock?
      @errors << "Este produto já foi vendido ou não está disponível para venda"
      return false
    end

    true
  end
end
