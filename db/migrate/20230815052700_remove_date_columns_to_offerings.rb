class RemoveDateColumnsToOfferings < ActiveRecord::Migration[7.0]
  def change
    remove_column :offerings, :initial_date, :datetime
    remove_column :offerings, :final_date, :datetime
  end
end
