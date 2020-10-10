class PetsController < ApplicationController
  def index
    # Why does this work with Pet.all and not Pets.all??
    @pets = Pet.all
  end
end
