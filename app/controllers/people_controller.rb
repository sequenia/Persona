class PeopleController < ApplicationController
  http_basic_authenticate_with name: "skala", password: "skala"
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @people = Person.all
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.create(person_params)

    respond_to do |format|
      if @person.errors.empty?
        format.html { redirect_to people_path, notice: 'Person was successfully created.' }
      else
        format.html { redirect_to people_path, notice: 'Error.' }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_path, notice: 'Person was successfully updated.' }
      else
        format.html { redirect_to people_path, notice: 'Error.' }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :birth, :psycho, :extrasensitive, :description)
    end
    
end