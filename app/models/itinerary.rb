class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reviewed_itineraries, through: :users

  # has_many :destinations
  # has_many :experiences, through: :destinations
  # has_many :accommodations, through: :destinations
  # has_many :transportations

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true

  def self.search(search)
    if search
      itinerary = Itinerary.where(['lower(title) LIKE ?', "%#{search.downcase}%"]) || IItinerary.where(['lower(description) LIKE ?', "%#{search.downcase}%"])
      if itinerary
        self.where(id: itinerary)
      else
        Itinerary.all
      end
    end
  end
end
