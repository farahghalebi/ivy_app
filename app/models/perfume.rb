# app/models/perfume.rb
class Perfume < ApplicationRecord
  CATEGORIES = [
    "Parfum",
    "Extrait de Parfum",
    "Eau de Parfum",
    "Eau de Toilette",
    "Eau de Cologne",
    "Eau Fraîche",
    "Body Mist"
  ].freeze

  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
