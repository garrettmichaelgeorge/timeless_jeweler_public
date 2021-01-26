class PeopleController < ApplicationController
  before_action :set_person, only: %i[edit update destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all.includes(:party)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.with_contact_info.find(params[:id])
    @household = @person.household
    @addresses = @person.addresses
    @email_addresses = @person.email_addresses
    @phone_numbers = @person.phone_numbers
    @store_transactions = @person.store_transactions
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit; end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    if @person.update(person_params)
      redirect_to @person
      flash.now[:success] = 'Customer was successfully updated.'
    else
      render :edit
      flash.now[:info] = 'Customer was not updated.'
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    # redirect_to people_url, success: 'Person was successfully deleted.'
    flash.now[:success] = 'Person was successfully deleted.'
    redirect_to people_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(permitted_params)
  end

  def permitted_params
    [
      :title,
      :first_name,
      :last_name,
      :suffix,
      :ring_size,
      :ring_size_notes,
      :necklace_length,
      :necklace_length_notes,
      :birthday,
      :household_id,
      { party: %i[id],
        household: %i[id household_name],
        addresses: %i[id address_line_1 address_line_2 city state_province zip_postal_code],
        email_addresses: %i[id email_address],
        phone_numbers: %i[id phone_number] }
    ]
  end
end
