class Tracer < ApplicationRecord
    has_many :productions, dependent: :destroy
end
