
class Sign < ActiveRecord::Base
belongs_to :payment

  # validation
  validates :payment_id, presence: true
end
