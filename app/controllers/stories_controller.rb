class StoriesController < ApplicationController
	def create
		@person = Person.find(params[:person_id])
		@story = @person.stories.create(params[:story].permit(:date, :is_positive))
		redirect_to person_path(@person)
	end

	def destroy
		Story.destroy(params[:id])
		@person = Person.find(params[:person_id])
		redirect_to person_path(@person)
	end

end
