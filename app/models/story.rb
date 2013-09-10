# coding: utf-8
class Story < ActiveRecord::Base
	belongs_to :person

    POSITIVE = 1
    NEGATIVE = 0
    ALL_TYPES = [POSITIVE, NEGATIVE]
    def getStoryType
    	sType = ""
    	if story_type == 0 then
			sType = "Негативная"
		else 
			sType = "Позитивная"
		end	
		return sType
    end
end
