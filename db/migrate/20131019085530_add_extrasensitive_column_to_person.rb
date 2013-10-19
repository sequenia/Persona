class AddExtrasensitiveColumnToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :extrasensitive, :boolean, :default => false
  end
end
