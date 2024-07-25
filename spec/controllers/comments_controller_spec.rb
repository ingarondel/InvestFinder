require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:idea) { create(:idea) }
  let(:comment) { create(:comment, idea: idea, user: user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      before { sign_in user }

      it 'creates a new comment' do
        expect {
          post :create, params: { idea_id: idea.id, comment: attributes_for(:comment) }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the idea page' do
        post :create, params: { idea_id: idea.id, comment: attributes_for(:comment) }
        expect(response).to redirect_to(idea_path(idea))
      end
    end

    context 'with invalid attributes' do
      before { sign_in user }

      it 'does not create a new comment' do
        expect {
          post :create, params: { idea_id: idea.id, comment: attributes_for(:comment, content: nil) }
        }.not_to change(Comment, :count)
      end

      it 're-renders the new template' do
        post :create, params: { idea_id: idea.id, comment: attributes_for(:comment, content: nil) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before { sign_in user }

    it 'assigns the requested comment to @comment' do
      get :edit, params: { id: comment.id }
      expect(assigns(:comment)).to eq(comment)
    end

    it 'renders the edit template' do
      get :edit, params: { id: comment.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      before { sign_in user }

      it 'updates the comment' do
        patch :update, params: { id: comment.id, comment: { content: 'Updated comment' } }
        comment.reload
        expect(comment.content).to eq('Updated comment')
      end

      it 'redirects to the idea page' do
        patch :update, params: { id: comment.id, comment: { content: 'Updated comment' } }
        expect(response).to redirect_to(idea_path(comment.idea))
      end
    end

    context 'with invalid attributes' do
      before { sign_in user }

      it 'does not update the comment' do
        original_content = comment.content
        patch :update, params: { id: comment.id, comment: { content: nil } }
        comment.reload
        expect(comment.content).to eq(original_content)
      end

      it 're-renders the edit template' do
        patch :update, params: { id: comment.id, comment: { content: nil } }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in user }

    it 'deletes the comment' do
      comment
      expect {
        delete :destroy, params: { id: comment.id }
      }.to change(Comment, :count).by(-1)
    end

    it 'redirects to the idea page' do
      delete :destroy, params: { id: comment.id }
      expect(response).to redirect_to(idea_path(comment.idea))
    end
  end
end
