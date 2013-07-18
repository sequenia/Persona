class AddStoryTypeColumnToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :story_type, :Integer
  end
end
