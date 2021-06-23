class StatsController < ApplicationController

    def index
        
        @clients = Client.order(:name)
        @tracers = Tracer.order(:molecule, :name)
        productions = Production.order(:client_id, :tracer_id)
        
        @stats = Hash.new
        productions.each do |production|
            @stats[production.client_id] ||= Hash.new
            @stats[production.client_id][production.tracer_id] ||= 0
            @stats[production.client_id][production.tracer_id] = @stats[production.client_id][production.tracer_id] + 1
        end
        
    end

end