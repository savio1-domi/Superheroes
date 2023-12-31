class PowersController < ApplicationController
    def create
        power = Power.create(power_params)

        if power.valid?
            render json: power, status: :created, except: [:created_at, :updated_at]

        else

            render json: {errors: "Failed to create powers"}
        end
    end


    def index
        render json: Power.all, status: :ok
    end

    def show
        power = Power.find(params[:id])

        if power
            render json: power, status: 200, except: [:created_at, :updated_at]
        else
            render json: {errors: "Power not found"}, status: :not_found
        end
    end


    def update
        power = Power.find(params[:id])

        if power
            result = power.update(power_params)
            render json: result, status: 200, except: [:created_at, :updated_at]

        else
            render json: {errors: "Power not found"}, status: :not_found
        end
    end

    def destroy
        power = Power.find(params[:id])
        if power
            power.destroy
            head :no_content
        end
    end

    private

    def power_params
        params.permit(:name, :description)
    end
end

