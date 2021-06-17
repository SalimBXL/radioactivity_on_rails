class Client < ApplicationRecord
    has_many :productions, dependent: :destroy
end
