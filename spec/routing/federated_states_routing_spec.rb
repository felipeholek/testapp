# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FederatedStatesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/federated_states').to route_to('federated_states#index')
    end

    it 'routes to #new' do
      expect(get: '/federated_states/new').to route_to('federated_states#new')
    end

    it 'routes to #show' do
      expect(get: '/federated_states/1').to route_to('federated_states#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/federated_states/1/edit').to route_to('federated_states#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/federated_states').to route_to('federated_states#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/federated_states/1').to route_to('federated_states#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/federated_states/1').to route_to('federated_states#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/federated_states/1').to route_to('federated_states#destroy', id: '1')
    end
  end
end
