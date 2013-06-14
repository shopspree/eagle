class UserObserver < ActiveRecord::Observer

  def after_create(user)
    organization = Organization.find_or_create_by_domain(domain user.email)
    user.create_actor(organization_id: organization.id) if organization
  end


  protected

  def domain(email)
    email.split("@").last if email
  end


end
