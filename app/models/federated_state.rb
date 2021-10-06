# frozen_string_literal: true

class FederatedState < ApplicationRecord
  has_many :cities

  validates :name, presence: true, uniqueness: true
end
