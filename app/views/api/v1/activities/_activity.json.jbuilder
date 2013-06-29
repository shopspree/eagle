json.(activity, :id, :timelineable_type, :created_at, :updated_at)
json.type activity.timelineable_type

if activity.timelineable.is_a? Post
  post = activity.timelineable
  json.post do |json|
    json.partial! post
  end

elsif activity.timelineable.is_a? Comment
  comment = activity.timelineable
  json.comment do |json|
    json.partial! comment
  end

elsif activity.timelineable.is_a? Like
  like = activity.timelineable
  json.like do |json|
    json.partial! like
  end

end