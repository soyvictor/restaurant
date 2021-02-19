class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user

    if @contact.save
      return
    else
      render :payments
    end
  end

  def edit
  end

  def update
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end
end
