class InventoryReportJob < ApplicationJob
  queue_as :default

  def perform
    products = Product.in_stock

    if products.empty?
      puts "📦 Nenhum produto em estoque no momento."
      return
    end

    message = format_report_message(products)
    puts message

    Rails.logger.info "Relatório de inventário gerado com sucesso!"
  end

  private

  def format_report_message(products)
    date = Time.current.strftime("%d/%m/%Y %H:%M")
    message = "📦 RELATÓRIO DE INVENTÁRIO - #{date}\n"

    products.each do |product|
      message += "📱 #{product.name} | "
      message += "💰 R$ #{format_currency(product.price)} | "
      message += "#{product.category.name} | "
      message += "🎨 #{product.color || 'N/A'} | "
      message += "💾 #{product.storage || 'N/A'} | "
      message += "🔋 #{product.battery_percentage}% | "
      message += "🛠️ #{product.condition.humanize}\n"
    end

    message
  end

  def format_currency(value)
    sprintf("%.2f", value).gsub(".", ",")
  end
end
