class AddPsychoColumnInPerson < ActiveRecord::Migration
  def change
  	add_column :people, :psycho, :boolean, :default => false
  end
end
