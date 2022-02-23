class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.integer :age
      t.string :company
      t.string :email
      t.string :phone_number
      t.string :twitter
      t.text :message

      t.timestamps
    end
  end
end
