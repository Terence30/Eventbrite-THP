class User < ApplicationRecord
	has_many :events, through: :attendances
	has_many :admin_event, foreign_key: 'admin_id', class_name: "Event"

end
