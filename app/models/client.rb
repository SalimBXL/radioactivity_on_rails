class Client < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true

    has_many :productions, dependent: :destroy
    validates_associated :productions
end
