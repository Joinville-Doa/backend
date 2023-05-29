require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe 'POST #execute' do
    it 'executa a consulta GraphQL e retorna uma resposta JSON' do
      query = 'query { users { id name } }'
      post :execute, params: { query: query }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_a(Hash)
      expect(json_response['data']).to be_a(Hash)
      expect(json_response['data']['users']).to be_a(Array)
    end

    it 'lida com erros do GraphQL e retorna uma resposta JSON' do
      query = 'query { nonExistentField }'
      post :execute, params: { query: query }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_a(Hash)
      expect(json_response['errors']).to be_a(Array)
    end

    it 'lida com erros de sintaxe GraphQL e retorna uma resposta JSON' do
      query = 'query { users { id name }'
      post :execute, params: { query: query }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_a(Hash)
      expect(json_response['errors']).to be_a(Array)
    end

    it 'lida com erros de variáveis GraphQL e retorna uma resposta JSON' do
      query = 'query ($id: ID!) { user(id: $id) { id name } }'
      post :execute, params: { query: query }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_a(Hash)
      expect(json_response['errors']).to be_a(Array)
    end

    it 'lida com erros de operação GraphQL e retorna uma resposta JSON' do
      query = 'mutation { users { id name } }'
      post :execute, params: { query: query }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_a(Hash)
      expect(json_response['errors']).to be_a(Array)
    end
  end
end
