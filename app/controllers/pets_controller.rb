class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet = Pet.create({
      name: params[:name],
      image: params[:image],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      adoption_status: 'adoptable',
      shelter_id: params[:id]
      })

    pet.save

    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end
end
