class ContactsController < ApplicationController
  before_action :authenticate_user!
  # before_filter :authenticate_admin, :except => [:index]
  layout "admin"

  def index
    @contacts = Contact.all

    @contacts = @contacts.where("concat_ws(' ', first_name, last_name,email,company,no_of_employees,solution) like ?", "%#{params[:search_terms]}%".gsub(/\s+/, ""))
      respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv}
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find_by_id(params[:id])
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      redirect_to contacts_path
      else
        render 'new'
    end
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    @contact.update_attributes(params_contact)
    if @contact.save
      redirect_to contacts_path
    else
      render 'edit'
    end
  end


  def destroy
    @contact = Contact.find_by_id(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def params_contact
    params.require(:contact).permit!
  end
end
