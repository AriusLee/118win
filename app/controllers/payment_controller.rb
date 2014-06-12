class PaymentController < ApplicationController
  def history
    @deposits = current_user.orders.all.paginate(page: params[:page], per_page: 50)
    @withdrawals = current_user.withdraws.all.paginate(page: params[:page], per_page: 50)
    @fund_transfers = current_user.fund_transfers.all.paginate(page: params[:page], per_page: 50)
  end
end
