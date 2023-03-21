class GroupsController < ActionController::Base
  before_action :authenticate_user!

  def index
    @user_id = current_user.id
    @categories = Group.includes(:group_transaction).where(user_id: current_user.id)
    @categories = @categories.map do |category|
      total_amount = 0
      category.group_transaction.each do |item|
        total_amount += item.transaction_info.amount
      end

      { category:, total_amount: }
    end

    render 'index'
  end

  def create
    name = params[:group][:name]
    icon = params[:group][:icon]
    group = Group.create(name:, icon:, user_id: current_user.id)

    if group.save
      flash[:success] = 'Category saved successfully'
      redirect_to '/'
    else
      flash[:error] = 'Category couldn`t be saved'
      render 'new'
    end
  end

  def new
    render 'new'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
