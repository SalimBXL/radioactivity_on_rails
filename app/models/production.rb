class Production < ApplicationRecord

    belongs_to :tracer
    paginates_per 2

    UNITS = {
        Bq: 0,
        MBq: 1,
        GBq: 2
    }

    def unit_to_string(value)
        UNITS.key(value)
    end

    def calibration_time_for_human
        "#{calibration_time.day<10 ? "0" : ""}#{calibration_time.day}/#{calibration_time.month<10 ? "0" : ""}#{calibration_time.month}/#{calibration_time.year} @ #{calibration_time.hour<10 ? "0" : ""}#{calibration_time.hour}:#{calibration_time.min<10 ? "0" : ""}#{calibration_time.min}"
    end
end
