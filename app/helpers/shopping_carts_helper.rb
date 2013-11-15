module ShoppingCartsHelper

  def add_to_item_list(shopping_list, item_id, quantity, max_quantity)

    @shopping_list_hash = eval(shopping_list)
    if @shopping_list_hash.has_key?(item_id)
      @shopping_list_hash[item_id] = [Integer(@shopping_list_hash[item_id]) + Integer(quantity), max_quantity].min
    else
      @shopping_list_hash[item_id] = [Integer(quantity), max_quantity].min
    end
    @shopping_list_hash.to_s

  end

end
