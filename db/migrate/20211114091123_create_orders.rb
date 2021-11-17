class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment
      t.integer :status

      t.timestamps
    end
  end
end
