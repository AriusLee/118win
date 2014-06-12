class BankAccount
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :account, type: String
end
