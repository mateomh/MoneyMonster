module ExpensesHelper
  def get_group_icon(exp)
    if exp.groups.first.nil?
      return exp.author.avatar_url
    else
      return exp.groups.first.icon
    end
  end

  def expenses_rendering(exps)
    unless exps.nil?
      render partial: "layouts/expenselist", locals: { expenses: exps }
    end
  end
end
