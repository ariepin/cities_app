require 'swagger_helper'

describe 'City API' do
  path '/api/v1/cities/{id}/add_to_favourites' do
    post 'Add city to favourites list' do
      tags 'Cities'
      security [Bearer: {}]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Add city to favourites list' do
        let(:id) { User.create(email: 'test@example.com', password: '123456789').id }
        run_test!
      end
    end
  end

  path '/api/v1/cities/{id}/remove_from_favourites' do
    delete 'Remove city from favourites list' do
      tags 'Cities'
      security [Bearer: {}]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Remove city from favourites list' do
        let(:id) { User.create(email: 'test@example.com', password: '123456789').id }
        run_test!
      end
    end
  end

  path '/api/v1/cities' do
    get 'Get all cities' do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :by_popularity, in: :query, type: :boolean

      response '200', 'Get all cities' do

        run_test!
      end
    end
  end
end
