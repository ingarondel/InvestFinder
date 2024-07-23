class ContactsController < ApplicationController
  before_action :set_user
  before_action :check_if_investor
  before_action :find_contact, only: %i[update edit destroy]

  def new
    @contact = Contact.new
  end

  def create
    @user = current_user
    @contact = @user.build_contact(contact_params)
    if @contact.save
      redirect_to user_path(@user)
      flash[:notice] = 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to user_path(@user)
      flash[:notice] = 'Your contact details successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = 'Contact was deleted successfully.'
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def check_if_investor
    unless @user.is_a?(Investor)
      redirect_to user_path(@user), alert: 'Only investors can have contacts.'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :website)
  end
end