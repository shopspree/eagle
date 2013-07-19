json.(subcategory, :id, :category_id, :name, :posts_count)

category = subcategory.category
json.post do |json|
  json.partial! category
end