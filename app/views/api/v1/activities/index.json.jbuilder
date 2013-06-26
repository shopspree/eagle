json.array! @activities do |activity|
  json.(activity, :id, :created_at, :updated_at)

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
end