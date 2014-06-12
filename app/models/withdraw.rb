class Withdraw
  include Mongoid::Document
  include Mongoid::Timestamps


  field :title,   type: String, default: ""
  field :amount, type: Integer
  #################
  # 1 pending   ###
  # 2 accepted  ###
  # 3 rejected  ###
  #################
  field :status, type: String, default: "pending"
  field :remark, type: String, default: ""

  field :is_hidden, type: Boolean, default: false

  scope :visible, ->{ where(is_hidden: false) }

  belongs_to :user

  after_update :update_amount

  def update_amount
    if self.status = "accepted"
      self.user.amount = self.user.amount - self.amount
      self.user.save!
    end
  end
end


