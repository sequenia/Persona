# coding: utf-8
class Person < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	def get_data_for_graph1
		stories_counter = stories.count()
		if (stories_counter) <3 then
			return "число событий <3, не могу построить график"
		end	
		stories_text = ""
		stories.each do |story|
			stories_text+=story.date.to_s + ", "
		end	
	return stories_text
	end	

	def get_dates_array
		date_arr = []
		i = 0
		while i < stories.count() do
			date_arr << stories[i].date.to_datetime.to_i
			i += 1
		end
		return date_arr.to_json
	end

	def get_values_array
		value_arr = []
		i = 0
		while i < stories.count() do
			value_arr << stories[i].is_positive
			i += 1
		end
		return value_arr.to_json
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
