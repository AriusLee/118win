class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,  type: String
  field :amount, type: Integer
  #################
  # 1 pending   ###
  # 2 accepted  ###
  # 3 rejected  ###
  #################
  field :status,            type: String, default: "pending"
  field :deposit_method,    type: String, default: ""
  field :bank_account,      type: String, default: ""
  field :deposit_date_time, type: String, default: ""

  field :remark, type: String, default: ""

  field :is_hidden, type: Boolean, default: false

  belongs_to :user

  after_update :update_amount

  scope :visible, ->{ where(is_hidden: false) }


  def update_amount
    if self.status = "accepted"
      self.user.amount = self.user.amount + self.amount
      self.user.save!
    end
  end

  def title_enum
    ['ibcbet', 'cmdbet', 'citibet', 'cm839', 'pfk188', 'naga99']
  end

  def status_enum
    ["pending", "accepted", "rejected"]
  end
end
