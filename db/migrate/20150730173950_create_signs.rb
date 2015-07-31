class CreateSigns < ActiveRecord::Migration
	def change
		create_table :signs do |t|
			t.integer :payment_id
			t.json :signature
			t.timestamps null: false
		end
	end
end
