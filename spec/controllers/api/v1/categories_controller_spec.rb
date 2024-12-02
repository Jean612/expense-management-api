# spec/controllers/api/v1/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'Food', color: '#FF5733', icon: 'utensils' } }
  let(:invalid_attributes) { { name: nil, color: '#FF5733', icon: 'utensils' } }
  let!(:category) { create(:category, user: user) }

  let(:api_token) { ENV['API_TOKEN'] || 'some_token' }
  let(:jwt_token) { JwtService.encode(user_id: user.id) } # Usando tu servicio JWT

  before do
    request.headers['API_TOKEN'] = api_token
    request.headers['Authorization'] = jwt_token
  end

  describe 'GET #index' do
    context 'when categories exist' do
      it 'returns a successful response' do
        get :index, params: {}
        expect(response).to have_http_status(:ok)
      end

      it 'returns a one category' do
        get :index, params: {}
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end

    context 'when no categories exist' do
      it 'returns an status ok' do
        Category.destroy_all
        get :index, params: {}
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array' do
        Category.destroy_all
        get :index, params: {}
        expect(JSON.parse(response.body)['data']).to eq([])
      end
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'return a created status' do
        post :create, params: valid_attributes

        expect(response).to have_http_status(:created)
      end

      it 'creates a new category' do
        expect do
          post :create, params: valid_attributes
        end.to change(Category, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'return a unprocessable_entity status' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new category' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(Category, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested category' do
        put :update, params: { id: category.id, name: 'Updated Name' }
        category.reload
        expect(category.name).to eq('Updated Name')
      end

      it 'updates returns a ok status' do
        put :update, params: { id: category.id, name: 'Updated Name' }
        category.reload
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the category' do
        put :update, params: { id: category.id, name: nil }
        category.reload
        expect(category.name).not_to eq(nil)
      end

      it 'return a unprocessable_entity status' do
        put :update, params: { id: category.id, name: nil }
        category.reload
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'return no_content status' do
      delete :destroy, params: { id: category.id }
      expect(response).to have_http_status(:no_content)
    end

    it 'destroys the requested category' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)
    end
  end
end
