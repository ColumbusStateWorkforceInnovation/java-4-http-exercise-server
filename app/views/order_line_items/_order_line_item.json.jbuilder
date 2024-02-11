json.extract! order_line_item, :id, :order_id, :count, :product_id, :created_at, :updated_at
json.url user_order_order_line_item_url(order_line_item.order.user.id, order_line_item.order.id, order_line_item, format: :json)
