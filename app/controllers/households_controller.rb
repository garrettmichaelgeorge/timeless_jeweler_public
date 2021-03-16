class HouseholdsController < ApplicationController
  before_action :set_household, only: [:edit, :update, :destroy]

  def new
    @household = Household.new
  end

  def edit
    @household = Household.find(params[:id])
  end

  def create
    @household = Household.new(household_params)

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, notice: 'Household was successfully created.' }
        format.json { render :show, status: :created, location: @household }
      else
        format.html { render :new }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @household.update(household_params)
        redirect_to @household
        flash.now[:success] = 'Household was successfully updated.'
        format.json { render :show, status: :ok, location: @household }
      else
        format.html { render :edit }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @household.destroy

    respond_to do |format|
      format.html { redirect_to households_url, success: 'Household was successfully destroyed.' }
      redirect_to households_path
      flash.now[:success] = 'Household was successfully deleted.'
      format.json { head :no_content }
    end
  end


  private

  def set_household
    @household = Household.find(params[:id])
  end

  def household_params
    params.require(:household).permit(:id)
  end
end
