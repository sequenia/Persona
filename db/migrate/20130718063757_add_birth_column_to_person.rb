class AddBirthColumnToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :birth, :date
  end
end
