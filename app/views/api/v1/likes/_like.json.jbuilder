json.(like, :id, :created_at, :updated_at)

post = like.post
json.post do |json|
  json.partial! post
end

json.user do |json|
  json.partial! like.actor.profile
end