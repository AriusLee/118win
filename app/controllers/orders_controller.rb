class OrdersController < ApplicationController
  def create
    order = current_user.orders.new(params[order_params])
    order.title = params[:Title]
    order.amount = params[:order][:amount]
    order.bank_account = params[:order][:bank_account]
    order.deposit_date_time = params[:order][:deposit_date_time]
    order.deposit_method = params[:deposit_method]
    if order.save!
      if params[:deposit_method] == "Credit Card"
        response = EXPRESS_GATEWAY.setup_purchase(params[:order][:amount].to_i,
          :ip                => request.remote_ip,
          :return_url        => payment_success_url,
          :cancel_return_url => root_url
        )
        redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
      else
        redirect_to payment_new_path(status: "success")
      end
    end
  end

 def order_params
    params.require(:order).permit!
  end
end
