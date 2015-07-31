class Payment < ActiveRecord::Base
 has_one :sign, dependent: :destroy
  belongs_to :user
end
