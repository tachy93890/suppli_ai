module ApplicationHelper
end
# app/helpers/application_helper.rb
module ApplicationHelper
  # Map flash keys to Bootstrap alert classes
  def bootstrap_class_for_flash(flash_type)
    case flash_type.to_sym
    when :notice then "success"
    when :alert  then "danger"
    when :error  then "danger"
    else "info"
    end
  end
end

# app/helpers/products_helper.rb
module ProductsHelper
  # Render product's tags as Bootstrap badges
  def render_tags(product)
    return "" if product.tags.empty?
    product.tags.map do |tag|
      content_tag(:span, tag.name, class: "badge bg-secondary me-1")
    end.join.html_safe
  end
end
