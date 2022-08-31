class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all
        if plants
            render json: plants, status: :created
        end
    end

    def create
        new_plant =Plant.create(production_params)
        render json: new_plant
    end

    def show
        plant = Plant.find_by(id: params[:id])
        render json: plant
    end

    private
    def production_params
        params.permit(:name, :image, :price)
    end
end
