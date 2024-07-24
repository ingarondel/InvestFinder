require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:user) { create(:user) }
  let(:idea) { create(:idea, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all ideas as @ideas' do
      get :index
      expect(assigns(:ideas)).to eq([idea])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested idea as @idea' do
      get :show, params: { id: idea.to_param }
      expect(assigns(:idea)).to eq(idea)
    end

    it 'assigns a new response as @response' do
      get :show, params: { id: idea.to_param }
      expect(assigns(:response)).to be_a_new(Response)
    end
  end

  describe 'GET #new' do
    it 'assigns a new idea as @idea' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested idea as @idea' do
      get :edit, params: { id: idea.to_param }
      expect(assigns(:idea)).to eq(idea)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Idea' do
        expect {
          post :create, params: { idea: attributes_for(:idea) }
        }.to change(Idea, :count).by(1)
      end

      it 'assigns a newly created idea as @idea' do
        post :create, params: { idea: attributes_for(:idea) }
        expect(assigns(:idea)).to be_a(Idea)
        expect(assigns(:idea)).to be_persisted
      end

      it 'redirects to the created idea' do
        post :create, params: { idea: attributes_for(:idea) }
        expect(response).to redirect_to(Idea.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved idea as @idea' do
        post :create, params: { idea: attributes_for(:idea, title: nil) }
        expect(assigns(:idea)).to be_a_new(Idea)
      end

      it 're-renders the #new template' do
        post :create, params: { idea: attributes_for(:idea, title: nil) }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:idea, title: 'New Title') }

      it 'updates the requested idea' do
        put :update, params: { id: idea.to_param, idea: new_attributes }
        idea.reload
        expect(idea.title).to eq('New Title')
      end

      it 'assigns the requested idea as @idea' do
        put :update, params: { id: idea.to_param, idea: new_attributes }
        expect(assigns(:idea)).to eq(idea)
      end

      it 'redirects to the idea' do
        put :update, params: { id: idea.to_param, idea: new_attributes }
        expect(response).to redirect_to(idea)
      end
    end

    context 'with invalid params' do
      it 'assigns the idea as @idea' do
        put :update, params: { id: idea.to_param, idea: attributes_for(:idea, title: nil) }
        expect(assigns(:idea)).to eq(idea)
      end

      it 're-renders the #edit template' do
        put :update, params: { id: idea.to_param, idea: attributes_for(:idea, title: nil) }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested idea' do
      expect {
        delete :destroy, params: { id: idea.to_param }
      }.to change(Idea, :count).by(-1)
    end

    it 'redirects to the ideas list' do
      delete :destroy, params: { id: idea.to_param }
      expect(response).to redirect_to(root_path)
    end
  end
end
