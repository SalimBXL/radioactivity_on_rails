class Production < ApplicationRecord

    belongs_to :tracer
    paginates_per 10

    UNITS = {
        Bq: 0,
        MBq: 1,
        GBq: 2
    }

    DIGITS_AFTER = 3
    DECAY_CONST = 0.693
    EULER = 2.718281828459045


    def unit_to_string(value)
        UNITS.key(value)
    end

    def calibration_time_for_human
        "#{calibration_time.day<10 ? "0" : ""}#{calibration_time.day}/#{calibration_time.month<10 ? "0" : ""}#{calibration_time.month}/#{calibration_time.year} @ #{calibration_time.hour<10 ? "0" : ""}#{calibration_time.hour}:#{calibration_time.min<10 ? "0" : ""}#{calibration_time.min}"
    end

    def time_for_human(t)
        "#{t.day<10 ? "0" : ""}#{t.day}/#{t.month<10 ? "0" : ""}#{t.month}/#{t.year} @ #{t.hour<10 ? "0" : ""}#{t.hour}:#{t.min<10 ? "0" : ""}#{t.min}"
    end

    def computed_activity
        (self.calibration_value * (EULER ** (-DECAY_CONST * (elapsed_time / self.tracer.halflife))))
    end

    def porcent_activity
        (computed_activity / self.calibration_value)

    end
    

    def elapsed_time
        ((DateTime.now.to_time - Time.new(self.calibration_time.year, self.calibration_time.month, self.calibration_time.day, self.calibration_time.hour, self.calibration_time.min)) / 1.minute).truncate()
        #(self.calibration_time.to_time - DateTime.now) / 60.0 / 60.0
        #(DateTime.now.to_time - self.calibration_time.to_time)
        #((DateTime.now.localtime.to_i - self.calibration_time.to_i) / 1.second / 1.minute)
        #((self.calibration_time.localtime.to_i - DateTime.now.localtime) / 1.second / 1.minute)
    end

    def is_from_today?
        self.calibration_time.to_date.today?
    end
end
