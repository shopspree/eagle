class PersonObserver < ActiveRecord::Observer

  def before_create(person)
    create_actor()
    create_profile(person)
    create_job_profile(person)
    default_follow(person)

  end


  protected

  def create_actor(person)
    person.create_actor(context_id: person.context_id)
  end

  def create_profile(person)
    email = user_email(person)
    person.create_profile(email: email) unless person.profile
  end

  def create_job_profile(person)
    email = user_email(person)
    person.create_job_profile(email: email) unless person.job_profile
  end

  def default_follow(person)
    if (Settings['follow.default.organization'])
      # follow organization group
      organization_groups = GroupType.find_by_name('Organization')
      organization_group = organization_groups.find_by_context_id(person.context)
      person.follows << organization_group
    end

  end

  def user_email(person)
    user = person.user
    email = user.email
  end
end
