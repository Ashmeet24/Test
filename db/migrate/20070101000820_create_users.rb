class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :image
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.string :salutation
      t.string :dob
	  t.string :kingdom_start_date
	  t.string :kingdom_today_date      	
      t.string :phone_no
      t.string :gender
      t.string :address
      t.string :street_name
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :role
      t.string :kids

      t.timestamps

end
end
end
