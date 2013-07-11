class AddRefToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :person, index: true
  end
end
