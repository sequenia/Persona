class RemoveSecondPersonColumnFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :second_person_id
  end
end
