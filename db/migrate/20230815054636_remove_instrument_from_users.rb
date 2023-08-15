class RemoveInstrumentFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :instrument, :string
  end
end
