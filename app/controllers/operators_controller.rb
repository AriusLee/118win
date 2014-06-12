class OperatorsController < ApplicationController
  layout "operators"

  def member_list
    @users = User.all.paginate(:page => params[:page], :per_page => 50)
  end

  def member_info
    @users = User.all.paginate(:page => params[:page], :per_page => 50)
  end

  def latest_withdraw
    @withdraws = Withdraw.visible.all.paginate(page: params[:page], per_page: 50)
    @total_amount = Withdraw.visible.sum(:amount)
  end

  def latest_transactions
    @transactions = Order.visible.all.paginate(page: params[:page], per_page: 50)
    @total_amount = Order.visible.sum(:amount)
  end

  def transaction
    @deposit = Order.find(params[:id])
  end

  def withdraw
    @withdraw = Withdraw.find(params[:id])
  end

  def transaction_update
    order = Order.find(params[:id])
    order.status = params[:status]
    order.remark = params[:remark]
    if params[:status] == "accepted"
      order.is_hidden = true
    end
    order.update!
    redirect_to operators_latest_transactions_path
  end

  def latest_registers
    @users = User.all.paginate(:page => params[:page], :per_page => 50)
  end

  def withdraw_update
    withdraw = Withdraw.find(params[:id])
    withdraw.status = params[:status]
    withdraw.remark = params[:remark]
    if params[:status] == "accepted"
      withdraw.is_hidden = true
    end
    withdraw.update!
    redirect_to operators_latest_withdraw_path
  end

  def latest_fund_transfer
    @fund_transfer = FundTransfer.visible.all.paginate(page: params[:page], per_page: 50)
  end

  def fund_transfer
    @fund_transfer = FundTransfer.find(params[:id])
  end

  def fund_transfer_update
    ft = FundTransfer.find(params[:id])
    ft.status = params[:status]
    ft.remark = params[:remark]
    if params[:status] == "accepted"
      ft.is_hidden = true
    end
    ft.update!
    redirect_to operators_latest_fund_transfer_path
  end

  def index
    @report1 = []
    @report2 = []
    @report3 = []
    @report1 = Withdraw.all
    @report2 = Order.all
    @report3 = FundTransfer.all
    @report = [@report1, @report2, @report3]
    @report.flatten!
    @report = Kaminari.paginate_array(@report).page(params[:page]).per(50)
  end
end
