json.(comment, :id, :content, :created_at, :updated_at, :likes_count)

post = comment.post
json.post do |json|
  json.partial! post
end

json.user do |json|
  json.partial! comment.actor.profile
end