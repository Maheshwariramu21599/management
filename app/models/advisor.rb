class Advisor < ApplicationRecord
    has_many :students
    validates :first_name, :last_name , presence: true 
end
