# coding: utf-8
class Person < ActiveRecord::Base
	
	has_many :stories, dependent: :destroy

	def get_dates_with_signs
		date_arr = []
		i = 0
		while i < stories.count() do
			date_arr << [stories[i].date.to_datetime.to_i, stories[i].story_type]
			i += 1
		end
		date_arr.sort! { |x, y| x[0] <=> y[0]}
		return date_arr.to_json
	end	

	def get_birth
        return birth.to_datetime.to_i
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
