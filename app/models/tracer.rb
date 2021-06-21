class Tracer < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :molecule, presence: true

    validates :halflife, presence: true
    validates :halflife, numericality: true

    has_many :productions, dependent: :destroy
    validates_associated :productions

    COLORS = {
        dark: "default",
        primary: "marine",
        secondary: "grey",
        success: "green",
        danger: "red",
        warning: "yellow",
        light: "white",
        info: "blue"
    }

    def color_to_string(value)
        COLORS.key(value)
    end

end
