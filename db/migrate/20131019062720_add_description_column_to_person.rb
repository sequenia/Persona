class AddDescriptionColumnToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :description, :string
  end
end
