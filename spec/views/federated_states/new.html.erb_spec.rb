# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'federated_states/new', type: :view do
  before(:each) do
    assign(:federated_state, FederatedState.new(
                               name: 'MyString',
                               acronym: 'MyString'
                             ))
  end

  it 'renders new federated_state form' do
    render

    assert_select 'form[action=?][method=?]', federated_states_path, 'post' do
      assert_select 'input[name=?]', 'federated_state[name]'

      assert_select 'input[name=?]', 'federated_state[acronym]'
    end
  end
end
