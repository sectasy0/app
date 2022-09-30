class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    create_join_table :orders, :products do |t|
      t.index :product_id
      t.index :order_id
    end
  end

end
