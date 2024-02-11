json.extract! order, :id, :created_at, :user_id, :created_at, :updated_at
json.url user_order_url(id: order.id, format: :json)
