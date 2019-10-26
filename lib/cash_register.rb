require 'pry'
class CashRegister
  attr_accessor :discount, :total, :items, :price, :quantity

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end
  def add_item(item, price, quantity=1)
    @subtotal = price * quantity
    @total += @subtotal
    quantity.times { items << item }
    # @total = total.apply_discount
  end
  def apply_discount
    @discount = @total * (@discount / 100.00)
    @total = @total - @discount
    if @discount > 0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  def items
    @items
  end
  def void_last_transaction
    @total -= @subtotal
    quantity.times { @items.pop }
  end

end
