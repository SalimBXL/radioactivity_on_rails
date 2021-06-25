class Commande < ApplicationRecord

    validates :tracer_id, presence: true
    validates :tracer_id, numericality: { only_integer: true }

    validates :activity, presence: true
    validates :activity, numericality: true
    
    validates :activity_unit_id, presence: true
    validates :activity_unit_id, numericality: { only_integer: true }

    validates :client_id, numericality: { only_integer: true }
    
    belongs_to :tracer
    belongs_to :client

    paginates_per 10

    STATUS = {
        written: 0,
        seen: 1,
        modified: 2,
        canceled: 3,
        done: 4
    }

    STATUS_COLOR = {
        secondary: 0,
        info: 1,
        warning: 2,
        danger: 3,
        default: 4
    }

    def status_to_string(value)
        STATUS.key(value)
    end

    def get_status_color
        STATUS_COLOR.key(self.status)
    end


    def date_for_human
        "#{date.day<10 ? "0" : ""}#{date.day}/#{date.month<10 ? "0" : ""}#{date.month}/#{date.year} @ #{date.hour<10 ? "0" : ""}#{date.hour}:#{date.min<10 ? "0" : ""}#{date.min}"
    end

    def is_from_today?
        self.date.to_date.today?
    end

end
