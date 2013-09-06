class StoriesController < ApplicationController
	def create
		@person = Person.find(params[:person_id])
		@story = @person.stories.create(params[:story].permit(:date, :story_type, :description))
		redirect_to person_path(@person)
	end

	def destroy
		Story.destroy(params[:id])
		@person = Person.find(params[:person_id])
		redirect_to person_path(@person)
	end

	def update
		@person = Person.find(params[:person_id])
		@story = Story.where(id: params[:id]).first
		@story.update(story_params)
		redirect_to person_path(@person)
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:date, :story_type, :description, :person_id)
    end

end
