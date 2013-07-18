class AddTypeColumnToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :type, :Integer
  end
end
