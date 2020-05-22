class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.where("actable_type = ?", params[:actable_type])
    @actable_type = params[:actable_type]
  end

  # GET /customers
  # GET /customers.json
  def index_customers
    @parties = Party.where("actable_type = ?", 'Party')
  end

  # GET /households
  # GET /households.json
  def index_households
    @parties = Party.where("actable_type = ?", 'Household')
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        redirect_to @party
        flash.now[:success] = 'Party was successfully updated.'
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, success: 'Party was successfully destroyed.' }
      # redirect_to parties_url
      # flash.now[:success] = 'Party was successfully deleted.'
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit(:actable_type)
  end

  def party_actable_type(actable_type)
    @party = Party.where(actable_type: actable_type.capitalize)
  end
end
