# coding: utf-8
class Person < ActiveRecord::Base
	
	has_many :stories, dependent: :destroy

	validates :name, presence: true
	validates :birth, presence: true

	after_create :build_default_stories

	def get_dates_with_signs
		date_arr = []
		i = 0
		while i < stories.count() do
			if stories[i].date != nil
				date_arr << [stories[i].date.to_datetime.to_i, stories[i].story_type, stories[i].description]
			else
				date_arr << [0, stories[i].story_type, stories[i].description]
			end
			i += 1
		end
		date_arr.sort! { |x, y| x[0] <=> y[0]}
		return date_arr.to_json
	end	

	def get_dates_count
		return stories.count()
	end	


	def valide_dates_for_graph
		 cnt = stories.count()
         result = true
         count_pos = 0
         count_neg = 0 
         if cnt > 2 then
         	i = 0
            while i < cnt do
            	if stories[i].story_type == 1 
            		then count_pos += 1
            	else count_neg += 1	
            	end	
            	i += 1	
            end
         end
         
         if count_neg == 0 or count_pos == 0 
         	then result = false 
		 end

         return result
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

	def get_person_names
		person_arr = []
		all_persons = Person.all

		i = 0
		while i < all_persons.count() do
			person_arr << [all_persons[i].id, all_persons[i].name]
			i += 1
		end

		return person_arr.to_json
		
	end

	private
		def build_default_stories
		  # build default profile instance. Will use default params.
		  # The foreign key to the owning User model is set automatically
		  self.stories.create(:description => 'Любовь 1', :story_type => 1)
		  self.stories.create(:description => 'Любовь 2', :story_type => 1)
		  self.stories.create(:description => 'Любовь 3', :story_type => 1)
		  self.stories.create(:description => 'Выигрыш', :story_type => 1)
		  self.stories.create(:description => 'Рождение детей', :story_type => 1)
		  self.stories.create(:description => 'Свадьба', :story_type => 1)

		  self.stories.create(:description => 'Расставание 1', :story_type => 0)
		  self.stories.create(:description => 'Расставание 2', :story_type => 0)
		  self.stories.create(:description => 'Расставание 3', :story_type => 0)
		  self.stories.create(:description => 'Предательство', :story_type => 0)
		  self.stories.create(:description => 'Финансовые потери', :story_type => 0)
		  self.stories.create(:description => 'Смерть близкого', :story_type => 0)
		  self.stories.create(:description => 'Болезнь, травма, авария', :story_type => 0)
		  true 
		end

end
