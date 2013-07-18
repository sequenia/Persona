class Story < ActiveRecord::Base
	belongs_to :person
    POSITIVE = 1
    NEGATIVE = 0
end
