class OrganizationObserver < ActiveRecord::Observer

  def before_create(organization)
    create_group(organization)
  end


  protected

  def create_group(organization)
    context = if Settings['context.global']
                Context.find_or_create_by_name(organization.name)
              else
                Context.find_by_name(Settings['context.global.name'])
              end

    Group.find_or_initialize_by_name(organization.name).update_attributes(context_id: context.id)

  end

end
