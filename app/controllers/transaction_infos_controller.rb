class TransactionInfosController < ActionController::Base
  before_action :authenticate_user!

  def index
    @group_transactions = GroupTransaction
      .includes(:transaction_info)
      .where(group_id: params[:group_id])
      .order(created_at: :desc)

    @total_amount = 0
    @group_transactions.each do |trans|
      @total_amount += trans.transaction_info.amount
    end

    render 'index'
  end

  def create
    name = params[:transaction_info][:name]
    amount = params[:transaction_info][:amount]
    group_id = params[:transaction_info][:category]

    transaction_info = TransactionInfo.create(name:, amount:, user_id: current_user.id)
    group_transaction = GroupTransaction.create(group_id:, transaction_info_id: transaction_info.id)

    if transaction_info.save && group_transaction.save
      flash[:success] = 'Category saved successfully'
      redirect_to "/users/#{current_user.id}/categories/#{group_id}"
    else
      @groups = Group.where(user_id: current_user.id)
      @groups = @groups.map do |group|
        [group.name, group.id]
      end
      flash[:error] = 'Category couldn`t be saved'
      render 'new'
    end
  end

  def new
    @groups = Group.where(user_id: current_user.id)
    @groups = @groups.map do |group|
      [group.name, group.id]
    end
    render 'new'
  end

  private

  def transaction_params
    params.require(:transaction_info).permit(:name, :amount, :category)
  end
end
