# frozen_string_literal: true
class CreateFederatedStates < ActiveRecord::Migration[5.2]
  def change
    create_table :federated_states do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end
