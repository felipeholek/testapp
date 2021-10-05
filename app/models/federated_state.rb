# frozen_string_literal: true

class FederatedState < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :cities
end
