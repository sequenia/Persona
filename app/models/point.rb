class Point < ActiveRecord::Base
	belongs_to :story, dependent: :destroy
end
