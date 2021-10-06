# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :federated_state

  validates :name, presence: true
  validates :federated_state, presence: true
end
