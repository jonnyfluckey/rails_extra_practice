class Person < ApplicationRecord

validates :age, numericality: {
  less_than_or_equal_to: 150,
  greater_than_or_equal_to: 18
}

validates :alive, inclusion: {
  in: %w ( true, false),
    message: "%{value} is invalid"
}

validates :gender, :name, :age, :alive,  presence: true

validates :name, uniqueness: true

validates :hair_color, :eye_color, allow_blank: true

before_create :set_alive

def set_alive
  self.alive = true
end

def self.by_age
  order(:age)
end

end
