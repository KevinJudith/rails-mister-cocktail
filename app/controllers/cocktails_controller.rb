class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    # render
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
      # I prefer to redirect to the home page with all cocktails
      # But I guess we'll need it to add a dose
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :body, :photo, :photo_cache)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
