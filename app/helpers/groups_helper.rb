module GroupsHelper
  def groups_rendering(grps)
    unless grps.nil?
      render partial: 'groupslist', locals: { groups: grps}
    end
  end
end
