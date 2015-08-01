class Payment < ActiveRecord::Base
 has_one :sign, dependent: :destroy
  belongs_to :user
  validates :amount, :product_name, :customer_name, :address, :city, :state, 
            :post_code, :country, :card_number, :phone, :card_expiry, :card_cvv, 
            :date_of_birth, presence: true
   def self.search(search)
      if search
       find(:all, :conditions => ['customer_name LIKE ?', "%#{search}%"])
     else
      :all
    end
  end
          

end


