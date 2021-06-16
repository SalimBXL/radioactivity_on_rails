class Tracer < ApplicationRecord
    has_many :productions, dependent: :destroy

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
