json.(like, :id, :created_at, :updated_at)

if @like.likeable.is_a? Post
  post = @like.likeable
  json.post do |json|
    json.partial! post
  end
elsif @like.likeable.is_a? Comment
  comment = @like.timelineable
  json.comment do |json|
    json.partial! comment
  end
end

json.user do |json|
  json.partial! like.actor.profile
end