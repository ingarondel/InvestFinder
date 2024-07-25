# spec/controllers/responses_controller_spec.rb
require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do
  let(:investor) { create(:investor) }
  let(:idea) { create(:idea) }
  let(:response) { create(:response, idea: idea, investor: investor) }

  before do
    sign_in investor
  end

  describe '#create' do
    context 'when the investor is authorized' do
      it 'creates a new response' do
        expect {
          post :create, params: { idea_id: idea.id, investor_id: investor.id }
        }.to change(Response, :count).by(1)
      end

      it 'redirects to the idea page' do
        post :create, params: { idea_id: idea.id }
        expect(response).to redirect_to(idea)
      end

      it 'sets a flash notice' do
        post :create, params: { idea_id: idea.id }
        expect(flash[:notice]).to eq('Your response was successfully created.')
      end
    end

    context 'when the response fails to save' do
      before do
        allow_any_instance_of(Response).to receive(:save).and_return(false)
      end

      it 'renders the idea show page' do
        post :create, params: { idea_id: idea.id }
        expect(response).to render_template('ideas/show')
      end
    end
  end

  describe '#destroy' do
    context 'when the investor has responded to the idea' do
      before do
        response
      end

      it 'destroys the response' do
        expect {
          delete :destroy, params: { idea_id: idea.id }
        }.to change(Response, :count).by(-1)
      end

      it 'redirects to the idea page' do
        delete :destroy, params: { idea_id: idea.id }
        expect(response).to redirect_to(idea)
      end

      it 'sets a flash notice' do
        delete :destroy, params: { idea_id: idea.id }
        expect(flash[:notice]).to eq('Response was removed successfully.')
      end
    end

    context 'when the investor has not responded to the idea' do
      it 'redirects to the idea page' do
        delete :destroy, params: { idea_id: idea.id }
        expect(response).to redirect_to(idea)
      end

      it 'sets a flash notice' do
        delete :destroy, params: { idea_id: idea.id }
        expect(flash[:notice]).to eq('You have not responded to this idea.')
      end
    end
  end

  private

  def sign_in(investor)
    allow(controller).to receive(:current_user).and_return(investor)
  end
end