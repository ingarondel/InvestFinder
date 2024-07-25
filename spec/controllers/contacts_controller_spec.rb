require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create(:user) }
  let(:investor) { create(:investor) }
  let(:contact) { create(:contact, investor: investor) }

  describe 'GET #new' do
    context 'when the user is an investor' do
      before { sign_in(investor) }

      it 'assigns a new Contact to @contact' do
        get :new, params: { user_id: investor.id }
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it 'renders the new template' do
        get :new, params: { user_id: investor.id }
        expect(response).to render_template :new
      end
    end

    context 'when the user is not an investor' do
      before { sign_in(user) }

      it 'redirects to the user_path' do
        get :new, params: { user_id: user.id }
        expect(response).to redirect_to user_path(user)
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is an investor' do
      before { sign_in(investor) }

      context 'with valid params' do
        let(:valid_params) { attributes_for(:contact) }

        it 'creates a new Contact' do
          expect {
            post :create, params: { user_id: investor.id, contact: valid_params }
          }.to change(Contact, :count).by(1)
        end

        it 'redirects to the user_path' do
          post :create, params: { user_id: investor.id, contact: valid_params }
          expect(response).to redirect_to user_path(investor)
        end
      end
    end

    context 'when the user is not an investor' do
      before { sign_in(user) }

      it 'redirects to the user_path' do
        post :create, params: { user_id: user.id, contact: attributes_for(:contact) }
        expect(response).to redirect_to user_path(user)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested contact to @contact' do
      sign_in(investor)
      get :edit, params: { user_id: investor.id, id: contact.id }
      expect(assigns(:contact)).to eq(contact)
    end

    it 'renders the edit template' do
      sign_in(investor)
      get :edit, params: { user_id: investor.id, id: contact.id }
      expect(response).to render_template :edit
    end

    it 'redirects to the user_path if the user is not an investor' do
      sign_in(user)
      get :edit, params: { user_id: user.id, id: contact.id }
      expect(response).to redirect_to user_path(user)
    end
  end

  describe 'PATCH #update' do
    it 'updates the requested contact if the user is an investor' do
      sign_in(investor)
      valid_params = attributes_for(:contact, website: 'Updated')
      patch :update, params: { user_id: investor.id, id: contact.id, contact: valid_params }
      contact.reload
      expect(contact.website).to eq('Updated')
    end

    it 'redirects to the user_path if the user is an investor' do
      sign_in(investor)
      valid_params = attributes_for(:contact, website: 'Updated')
      patch :update, params: { user_id: investor.id, id: contact.id, contact: valid_params }
      expect(response).to redirect_to user_path(investor)
    end

    it 'redirects to the user_path if the user is not an investor' do
      sign_in(user)
      patch :update, params: { user_id: user.id, id: contact.id, contact: attributes_for(:contact) }
      expect(response).to redirect_to user_path(user)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested contact if the user is an investor' do
      sign_in(investor)
      expect {
        delete :destroy, params: { user_id: investor.id, id: contact.id }
      }.to change(Contact, :count).by(-1)
    end

    it 'redirects to the user_path if the user is an investor' do
      sign_in(investor)
      delete :destroy, params: { user_id: investor.id, id: contact.id }
      expect(response).to redirect_to user_path(investor)
    end

    it 'redirects to the user_path if the user is not an investor' do
      sign_in(user)
      delete :destroy, params: { user_id: user.id, id: contact.id }
      expect(response).to redirect_to user_path(user)
    end
  end
end