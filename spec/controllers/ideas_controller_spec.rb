require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:idea)  { create(:idea) }

  describe 'GET #index' do
    let(:ideas) { create_list(:idea, 3) }

    before do
      get :index
    end

    it 'populates an array of all ideas' do
      expect(assigns(:ideas)).to match_array(ideas)
    end

     it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: idea }
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end
    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'with valid attributes saves a new idea in the database' do
        expect { post :create, params: { idea: attributes_for(:idea) } }.to change(Idea, :count).by(1)
      end
      it 'redirects to show view' do
        post :create, params: { idea: attributes_for(:idea) }
        expect(response).to redirect_to assigns(:idea)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the idea' do
        expect { post :create, params: { idea: attributes_for(:idea, :invalid) } }.to_not change(Idea, :count)
      end
      it 're-renders new view' do
        post :create, params: { idea: attributes_for(:idea, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:idea) { create(:idea) }

    it 'deletes an idea' do
        expect { delete :destroy, params: { id: idea } }.to change(Idea, :count).by(-1)
    end

    it 'redirects to question' do
      delete :destroy, params: { id: idea }
      expect(response).to redirect_to root_path
    end
  end

   describe 'PATCH #update' do
    context 'with valid attributes' do
      before do
        patch :update, params: { id: idea, idea: attributes_for(:idea) }
      end
      it 'assigns the requested idea to @idea' do
        expect(assigns(:idea)).to eq idea
      end
      it 'changes idea attributes' do
        idea.reload
        expect(idea.description).to eq 'MyText'
      end
      it 'redirects to idea' do
        expect(response).to redirect_to idea
      end
    end

    context 'with invalid attributes' do
      before do
        patch :update, params: { id: idea, idea: attributes_for(:idea, :invalid) }
      end
      it 'does not change idea' do
        idea.reload
        expect(idea.title).to eq 'MyString'
      end
      it 're-renders idea' do
        expect(response).to render_template :edit
      end
    end
  end
end
