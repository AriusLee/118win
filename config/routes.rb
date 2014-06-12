Asiasport88::Application.routes.draw do
  constraints(:host => /128win.net/) do
    match "/admin" => redirect {|params, req| "http://128.game-host.org/admin"},  via: [:get, :post]
  end

  constraints(:host => /128.game-host.org/) do
    redirect("http://128.game-host.org/admin")
  end

  captcha_route
  devise_for :admins
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: "home#index"

  get '/payment/success', :to => 'payment#success', as: :payment_success
  get '/payment/history', :to => 'payment#history', as: :payment_history
  get '/payment/failed', :to => 'payment#failed', as: :payment_failed
  get '/payment/new', :to => 'payment#new', as: :payment_new
  get '/payment/deposits', :to => 'payment#deposits', as: :payment_deposits
  get '/payment/withdrawals', :to => 'payment#withdrawals', as: :payment_withdrawals
  get '/payment/deposit-limits', :to => 'payment#deposit_limits', as: :payment_deposit_limits
  get '/admins/users', :to => 'admins#index', as: :admins_index
  get '/admins/payments', :to => 'admins#payments', as: :admins_payments
  get '/infos/banking', :to => 'infos#banking', as: :infos_banking
  get '/infos/sportsbook', :to => 'infos#sportsbook', as: :infos_sportsbook
  get '/infos/casino', :to => 'infos#casino', as: :infos_casino
  get '/infos/4d', :to => 'infos#4d', as: :infos_4d
  get '/infos/promotion', :to => 'infos#promotion', as: :infos_promotion
  get '/infos/contact', :to => 'infos#contact', as: :infos_contact
  get '/live-stream', :to => 'infos#stream', as: :infos_stream

  resources :orders

  resources :withdraws
  resources :fund_transfers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/operator/dashboard', :to => 'operators#index', as: :operators
  get '/operator/member-info', :to => 'operators#member_info', as: :operators_member_info
  get '/operator/transactions', :to => 'operators#latest_transactions', as: :operators_latest_transactions
  get '/operator/withdraw', :to => 'operators#latest_withdraw', as: :operators_latest_withdraw
  get '/operator/fund_transfer', :to => 'operators#latest_fund_transfer', as: :operators_latest_fund_transfer
  get '/operator/registers', :to => 'operators#latest_registers', as: :operators_latest_registers
  get '/operator/report', :to => 'operators#report', as: :operators_report
  get '/operator/admin-password', :to => 'operators#admin_password', as: :operators_admin_password
  get '/operator/member-list', :to => 'operators#member_list', as: :operators_member_list
  get '/operator/messages', :to => 'operators#messages', as: :operators_messages
  get '/operator/message', :to => 'operators#message', as: :operators_message
  get '/operator/public-message', :to => 'operators#public_messages', as: :operators_public_messages
  get '/operator/user-message', :to => 'operators#user_messages', as: :operators_user_messages
  get '/operator/member-log', :to => 'operators#member_log', as: :operators_member_log
  get '/operator/transaction/:id', :to => 'operators#transaction', as: :operators_transaction
  get '/operator/withdraw/:id', :to => 'operators#withdraw', as: :operators_withdraw
  get '/operator/fund_transfer/:id', :to => 'operators#fund_transfer', as: :operators_fund_transfer

  post '/operator/transaction/:id', :to => 'operators#transaction_update', as: :operators_transaction_update
  post '/operator/withdraw/:id', :to => 'operators#withdraw_update', as: :operators_withdraw_update
  post '/operator/fund_transfer/:id', :to => 'operators#fund_transfer_update', as: :operators_fund_tranfer_update
end
