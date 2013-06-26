json.(post, :id, :content, :created_at, :updated_at, :comments_count, :likes_count)

json.medias post.medias do |media|
  json.url media.url_string
  json.type media.media_type.name
  json.created_at media.created_at
  json.updated_at media.updated_at
end

json.user do |json|
  json.partial! post.actor.profile
end