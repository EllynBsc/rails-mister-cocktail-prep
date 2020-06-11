class Dose < ApplicationRecord
  belongs_to :cocktail
  # @dose.cocktail => one instance
  belongs_to :ingredient
  # @dose.ingredient => one instance

  validates :cocktail, uniqueness: { scope: :ingredient }
  validates :description, presence: true
end

