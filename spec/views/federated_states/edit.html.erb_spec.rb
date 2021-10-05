# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'federated_states/edit', type: :view do
  before(:each) do
    @federated_state = assign(:federated_state, FederatedState.create!(
                                                  name: 'MyString',
                                                  acronym: 'MyString'
                                                ))
  end

  it 'renders the edit federated_state form' do
    render

    assert_select 'form[action=?][method=?]', federated_state_path(@federated_state), 'post' do
      assert_select 'input[name=?]', 'federated_state[name]'

      assert_select 'input[name=?]', 'federated_state[acronym]'
    end
  end
end
