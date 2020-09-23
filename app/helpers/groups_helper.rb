module GroupsHelper
  def groups_rendering(grps)
    render partial: 'groupslist', locals: { groups: grps } unless grps.nil?
  end
end
