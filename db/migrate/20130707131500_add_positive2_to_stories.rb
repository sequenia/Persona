class AddPositive2ToStories < ActiveRecord::Migration
  def change
    add_column :stories, :is_positive, :boolean
  end
end
