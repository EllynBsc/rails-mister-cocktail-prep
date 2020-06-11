class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    # raise
    @cocktail = Cocktail.find(params[:id])
  end

  def index
    @cocktails = Cocktail.all
  end

  private

  def strong_params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
