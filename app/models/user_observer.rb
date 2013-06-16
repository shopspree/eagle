class UserObserver < ActiveRecord::Observer

  def after_create(user)
    organization = Organization.find_or_create_by_domain(domain user.email)
    if organization
      context = Context.find_or_create_by_name(organization.name)
      user.create_actor(context_id: context.id)
    end

  end


  protected

  def domain(email)
    email.split("@").last if email
  end


end
