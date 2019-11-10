class Section < ApplicationRecord
    belongs_to :course
    has_many :sections
    has_many :courses
end
