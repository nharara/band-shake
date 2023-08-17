class AddUrlToOffering < ActiveRecord::Migration[7.0]
  def change
    add_column :offerings, :url, :string;
  end
end
