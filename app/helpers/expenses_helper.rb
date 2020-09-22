module ExpensesHelper
  def get_group_icon(exp)
    if exp.groups.first.nil?
      return exp.author.avatar_url
    else
      return exp.groups.first.icon
    end
  end
end
