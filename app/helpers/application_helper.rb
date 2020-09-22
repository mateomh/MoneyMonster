module ApplicationHelper
  def navbar_rendering
    render partial: "layouts/navbar" unless session[:user_id].nil?
  end
end
