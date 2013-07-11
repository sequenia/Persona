class AddPositiveToStories < ActiveRecord::Migration
  def change
    add_column :stories, :isPositive, :boolean
  end
end
