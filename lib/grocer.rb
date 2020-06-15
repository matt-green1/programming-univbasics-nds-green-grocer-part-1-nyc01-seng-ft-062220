require 'pry'

def find_item_by_name_in_collection(name, collection)
  all_items_list = []
  #here we compile list of all items in list
  if collection.length == 0
    return nil
  end
  collection.each{|element|
    all_items_list.push(element[:item])
  }
  
  #now we can do our comparison of name to list of all items
  collection.each {|element|
    if !all_items_list.include?(name)
      return nil
    elsif all_items_list.include?(name)
      if element[:item] == name
        return element
      end
    end
  }
end

def consolidate_cart(cart)
  #binding.pry
  new_cart = []
  #binding.pry
  cart.each{|item_element|
    #binding.pry
    if !find_item_by_name_in_collection(item_element[:item], new_cart)
      #binding.pry
      item_element[:count] = 1
      new_cart.push(item_element)
    elsif find_item_by_name_in_collection(item_element[:item], new_cart)
      find_item_by_name_in_collection(item_element[:item], new_cart)[:count] +=1
    end  
  }
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  return new_cart
end
