class CreateOfferings < ActiveRecord::Migration[7.0]
  def change
    create_table :offerings do |t|
      t.integer :price
      t.datetime :initial_date
      t.datetime :final_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
