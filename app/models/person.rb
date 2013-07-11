class Person < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	def get_data_for_graph1
		stories_counter = stories.count()
		if (stories_counter) <5 then
			return "число событий <5, не могу построить график"
		end	
		stories_text = ""
		stories.each do |story|
			stories_text+=story.date.to_s + ", "
		end	
	return stories_text
	end	

	def get_data_for_graph2
		stories_counter = stories.count()
		if (stories_counter) <1 then
			return "число событий <1, не могу построить график"
		end	
		stories_text = ""
		stories.each do |story|
			stories_text+=story.date.to_s + ", "
		end	
	return stories_text
	end	
end
