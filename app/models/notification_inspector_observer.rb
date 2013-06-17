class NotificationInspectorObserver < ActiveRecord::Observer

  observe :comment, :like

  def after_create(object)
    object_sym = object.class.name.to_sym
    case object_sym
      when :like
        like_notification object
      when :comment
        comment_notification object
      else
        nil
    end
  end


  protected

  def like_notification(like)
    if like.likeable_type == 'Post'
      post = like.post
      notify_post_actor like.activity, post
    elsif like.likeable_type == 'Comment'
      comment = like.comment
      notify_comment_actor like.activity, comment
    end
  end

  def comment_notification(comment)
    post = comment.post
    notify_post_actor comment.activity, post

    post.comments.each do |post_comment|
      notify_comment_actor comment.activity, post_comment
    end
  end

  def notify_post_actor(post, activity)
    actor = post.actor
    actor.notifications.create(activity_id: activity.id)
  end

  def notify_comment_actor(comment, activity)
    actor = comment.actor
    actor.notifications.create(activity_id: activity.id)
  end

end
