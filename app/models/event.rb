class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

  validates :start_date, presence: true
	validate :event_past
	validates_numericality_of :duration, presence: true, :only_integer => true, :greater_than_or_equal_to => 1
	validate :multiple_of_5
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 5..140 }
	validates_numericality_of :price, presence: true, :only_integer => true, :greater_than_or_equal_to => 1
  validates_numericality_of :price, :only_integer => true, :less_than_or_equal_to => 1000
  validates :location, presence: true

	private

	def event_past
      if start_date != nil
      if start_date < DateTime.now
      	errors.add(:start_date, "La date de départ de l'event ne peut pas etre dans le passé")
      end
    end
    end

    def multiple_of_5
      if duration != nil
      if duration % 5 != 0
      	errors.add(:duration, "La durée doit etre un multiple de 5")
      end
    end
    end

    

end
