# app/jobs/price_check_job.rb
class PriceCheckJob < ApplicationJob
  queue_as :default  # uses Sidekiq default queue

  def perform(product_id)
    product = Product.find_by(id: product_id)
    return unless product && product.active?  # only check active products, and exit if product no longer exists

    # Imagine there's an ExternalPricingService that can fetch the latest price
    begin
      new_price = ExternalPricingService.fetch_price(product.sku)
    rescue StandardError => e
      Rails.logger.error "PriceCheckJob: failed to fetch price for Product #{product_id} - #{e.message}"
      # The job will be retried by Sidekiq (default retry) if an exception is raised.
      raise 
    end

    if new_price.present? && new_price < product.price
      # Update the product's price and notify the user about the drop
      product.update(price: new_price)
      PriceAlertMailer.price_drop_alert(product.user, product, new_price).deliver_later
    end
    # (No else needed; if price didn't drop, we do nothing this run.)
  end
end
