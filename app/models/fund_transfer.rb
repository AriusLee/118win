class FundTransfer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :from_fund, type: String,  default: ""
  field :to_fund,   type: String,  default: ""
  field :amount,    type: Integer, default: ""
  field :status,    type: String, default: "pending"
  field :remark,    type: String, default: ""

  field :is_hidden, type: Boolean, default: false

  scope :visible, ->{ where(is_hidden: false) }

  belongs_to :user
end
