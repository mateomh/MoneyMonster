module ApplicationHelper
  def navbar_rendering
    render partial: 'layouts/navbar' unless session[:user_id].nil?
  end

  def information_rendering
    render partial: 'layouts/info' unless notice.nil? && alert.nil?
  end
end
