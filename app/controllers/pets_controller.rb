class PetsController < ApplicationController
  def index
    @pets = ["pet_1", "pet_2", "pet_3"]
  end
end
