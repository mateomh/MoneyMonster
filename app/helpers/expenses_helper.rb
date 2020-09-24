module ExpensesHelper
  def get_group_icon(exp)
    if exp.groups.first.nil?
      exp.author.avatar_url
    else
      exp.groups.first.icon
    end
  end

  def expenses_rendering(exps)
    render partial: 'layouts/expenselist', locals: { expenses: exps } unless exps.nil?
  end

  def total_expenses(exps)
    exps.total_amount
  end
end
