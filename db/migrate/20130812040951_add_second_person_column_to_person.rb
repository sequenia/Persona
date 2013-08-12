class AddSecondPersonColumnToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :second_person_id, :Integer
  end
end
