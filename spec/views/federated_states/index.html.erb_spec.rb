# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'federated_states/index', type: :view do
  before(:each) do
    assign(:federated_states, [
             FederatedState.create!(
               name: 'Name',
               acronym: 'Acronym'
             ),
             FederatedState.create!(
               name: 'Name',
               acronym: 'Acronym'
             )
           ])
  end

  it 'renders a list of federated_states' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Acronym'.to_s, count: 2
  end
end
