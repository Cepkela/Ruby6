class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all #Parodomi visi kontaktai
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new #Ismetamo naujo kontakto forma
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params) # sukuriamas naujas kontaktas

    respond_to do |format| # Reauguojama i šita actiona kad klientui butu suformuota html kalba.
      if @contact.save #jei contactas yra saugojamas
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' } #formatuoja html kalba, taip pat isemata zinute kad sukrtas contactas
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params) # jei contactas yra tvarkoams
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' } #formatuoja html kalba, taip pat isemata zinute kad sukrtas contactas
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy #contactas yra naikinamas
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id]) #kontakto paieska pagal id
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone_number, :email) #kokius paramatrus reikia atvaizduoti
    end
end
