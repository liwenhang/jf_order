module ApplicationHelper
  def link_association_image(obj, f)
    if obj.pictures.count > 0 && (f.index != 'new_pictures')
      image_tag obj.pictures[f.index.to_i].name.url, width: 30
    end
  end

  def order_state(order)
    case order.state
    when 'pending'
      '待支付'
    when 'paid'
      '已支付'
    when 'confirmed'
      '已确认'
    when 'refunded'
      '已退款'
    when 'delivered'
      '已完成'
    else
      '已失效'
    end
  end
end
