# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #query' do
      expect(get: '/cities/query').to route_to('cities#query')
    end
  end
end
