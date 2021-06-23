class StatsController < ApplicationController

    def index
        
        @clients = Hash.new
        Client.order(:name).each do |client|
            @clients[client.id] = client.name
        end

        @tracers = Hash.new
        Tracer.order(:molecule, :name).each do |tracer|
            @tracers[tracer.id] ||= Hash.new
            @tracers[tracer.id][:name] ||= tracer.name
            @tracers[tracer.id][:color] ||= tracer.color_to_string(tracer.color)
        end

        @productions = Hash.new
        @production_totale = 0
        Production.order(:client_id, :tracer_id).each do |production|
            @productions[production.id] ||= Hash.new
            @productions[production.client_id] ||= Hash.new
            @productions[production.client_id][:total] ||= 0
            #@productions[production.client_id][production.tracer_id] = 0 if @productions[production.client_id][production.tracer_id].nil?
            @productions[production.client_id][production.tracer_id] ||= 0
            @productions[production.client_id][production.tracer_id] = @productions[production.client_id][production.tracer_id] + 1
            @productions[production.client_id][:total] = @productions[production.client_id][:total] + 1
            @production_totale = @production_totale + 1
        end
    
    end

end