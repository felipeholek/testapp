# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :federated_state, foreign_key: true

      t.timestamps
    end
  end
end
