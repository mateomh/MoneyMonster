require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  it 'renders a list of expenses' do
    User.create(name: 'mateo')
    session[:user_name] = User.last.name
    session[:user_id] = User.last.id
    session[:avatar] = User.last.avatar_url
    get :index
    expect(response).to render_template('index')
  end
end
