class AddInstrumentToOfferings < ActiveRecord::Migration[7.0]
  def change
    add_column :offerings, :instrument, :string
  end
end
