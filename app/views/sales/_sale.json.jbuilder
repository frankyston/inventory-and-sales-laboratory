json.extract! sale, :id, :value_total, :customer_id, :is_client, :created_at, :updated_at
json.url sale_url(sale, format: :json)
