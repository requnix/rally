class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.integer :year
      t.string :first_name
      t.string :last_name
      t.text :residential_address
      t.text :postal_address
      t.string :contact_number
      t.string :alternate_contact_number
      t.string :email
      t.string :motorcycle
      t.string :chapter
      t.string :shirt_size
      t.string :payment_method
      t.boolean :terms_and_conditions
      t.string :reference
      t.boolean :rider
      t.boolean :paid

      t.timestamps
    end
  end
end
