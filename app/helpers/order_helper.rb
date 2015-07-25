module OrderHelper

  def get_item_name(name)
    set = name[-1]==1.to_s ? "A 套餐" : "B 套餐";
    puts name[-1]
    name[0...-1]+" - "+set
  end


  def count_total(order_set)
    count =0
    for order in order_set
      count+=order.amount
    end
    return count
  end



end
