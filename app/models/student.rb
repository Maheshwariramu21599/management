class Student < ApplicationRecord
    belongs_to :room
    belongs_to :advisor
    validates :first_name, :last_name , presence: true
end
