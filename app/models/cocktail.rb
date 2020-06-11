class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  # @cocktail.doses => active record relation, array of instances of doses attached to the cocktail instance
  has_many :ingredients, through: :doses
  # @cocktail.ingredients
  validates :name, presence: true, uniqueness: true
end
