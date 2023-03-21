class RootController < ActionController::Base
  def index
    if user_signed_in?
      redirect_to "/users/#{current_user.id}/categories"
      return
    end
    render 'index'
  end
end
