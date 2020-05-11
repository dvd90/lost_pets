class PetsController < ApplicationController
  before_action :find_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    # @logo = logo_species(@pet.species)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save

    redirect_to @pet
  end

  def edit
  end

  def update
    @pet = Pet.update(pet_params)

    redirect_to @pet
  end

  def destroy
    @pet.destroy

    redirect_to pets_path
  end

  private

  def logo_species(pet)
    case pet
    when "dog"
       🐶
    when "cat"
       😸
    when "turtle"
       🐢
    when "snake"
       🐍
    when "rabbit"
       🐰
    end
  end

  def pet_params
    params.require(:pet).permit(:name, :address, :species, :found_on)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
