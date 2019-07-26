require 'swagger_helper'

describe 'User API' do
  path '/api/v1/sign_up' do
    post 'Register' do
      tags 'Register'
      consumes 'application/json'
      parameter name: :body, in: :body, schema: {
        type: :object,
        properties: {
          user: { type: :object, properties: {
            email: { type: :string },
            password: { type: :string }
          }}
        },
        required: ['email', 'password']
      }

      response '201', 'Register' do
        let(:body) { { "user": { "email": "test@example.com", "password": "123456789" } }}
        run_test!
      end
    end
  end

  path '/api/v1/sign_in' do
    post 'Login' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :body, in: :body, schema: {
        type: :object,
        properties: {
          auth: { type: :object, properties: {
            email: { type: :string },
            password: { type: :string }
          }}
        },
        required: ['email', 'password']
      }

      response '201', 'Login' do
        let!(:user) { User.create(email: 'test@example.com', password: '123456789') }
        let(:body) { { "auth": { "email": "test@example.com", "password": "123456789" } } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/favourite_cities' do
    get 'Show user favourite cities' do
      tags 'Cities'
      security [Bearer: {}]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Favourite cities' do
        let!(:user) { User.create(email: 'test@example.com', password: '123456789') }
        let(:Authorization) { 'Token token="#{Knock::AuthToken.new(payload: { sub: User.last.id } ).token}"' }
        let(:id) { user.id }
        run_test!
      end
    end
  end
end
