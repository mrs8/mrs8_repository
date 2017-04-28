json.extract! medicine, :id, :medicine_name, :dosage, :quantity_or_volume, :manufacturer, :need_recipe, :price, :category_id, :created_at, :updated_at
json.url medicine_url(medicine, format: :json)
