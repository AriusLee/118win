class WithdrawsController < ApplicationController
  def new
  end

  def create
    #if params[:amount].to_i > current_user.amount
    #  flash[:notice] = "Not enough amount to withdraw"
    #  redirect_to new_withdraw_path
    #else
    current_user.withdraws.create!(amount: params[:amount], title: params[:Title])
    flash[:notice] = "Successful Withdraw"
    redirect_to new_withdraw_path(status: "success")
    #end
  end
end
