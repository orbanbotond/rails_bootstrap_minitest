module ProductsHelper
  def display_price(product, user)
    if user.admin?
      "#{product.price_range.begin} .. #{product.price_range.end}"
    elsif user.buyer? || user.supplier?
      product.prices_for( user.administratable).to_a.map{|p|p.price}
    end
  end

  def prices(product, user)
    if user.admin?
      product.prices
    elsif user.buyer? || user.supplier?
      product.prices_for( user.administratable)
    end
  end
end
