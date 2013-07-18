class RemoveTypeColumnFromStories < ActiveRecord::Migration
  def change
  	remove_column :stories, :type
  end
end
