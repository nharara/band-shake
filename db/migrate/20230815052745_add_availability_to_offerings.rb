class AddAvailabilityToOfferings < ActiveRecord::Migration[7.0]
  def change
    add_column :offerings, :availability, :string
  end
end
