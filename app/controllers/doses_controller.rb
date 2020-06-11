class DosesController < ApplicationController

  def new #GET
    # raise
    @cocktail = Cocktail.find(params[:cocktail_id]) #parametized url
    @dose = Dose.new
  end

  def create #POST
    # raise
    # 1.grabbing the id of the parent in the parametized url
    @cocktail = Cocktail.find(params[:cocktail_id]) #parametized url
    # 2.creating the dose instance with strong params
    @dose = Dose.new(strong_params_dose)
    # 3.Associate the dose to the cocktail (a dose belongs to a cocktail)
    @dose.cocktail_id = @cocktail.id
    # @dose.cocktail = @cocktail
    # 4.Save it
    # @dose.save
    # 5. BETTER UX
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  def destroy #DELETE
    # raise
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def strong_params_dose
    params.require(:dose).permit(:description, :ingredient_id) #the attributes input coming from what the user fills in the form
  end

end
