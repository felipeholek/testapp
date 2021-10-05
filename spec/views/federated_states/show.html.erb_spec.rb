# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'federated_states/show', type: :view do
  before(:each) do
    @federated_state = assign(:federated_state, FederatedState.create!(
                                                  name: 'Name',
                                                  acronym: 'Acronym'
                                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Acronym/)
  end
end
