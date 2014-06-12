class FundTransfersController < ApplicationController
  def new
  end

  def create
    current_user.fund_transfers.create!(from_fund: params[:from_fund], to_fund: params[:to_fund], amount: params[:fund_transfer][:amount])
    redirect_to new_fund_transfer_path(status: "success")
  end
end
