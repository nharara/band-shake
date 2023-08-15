class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :age, :integer
    add_column :users, :phone_number, :string
    add_column :users, :instrument, :string
    add_column :users, :experience, :text
    add_column :users, :city, :string
  end
end
