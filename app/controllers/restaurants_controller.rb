class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index  
        restaurant = Restaurant.all
        render json: restaurant
    end

    def show   
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, include: :pizzas
    end

    def destroy   
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
    end

    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
    end
    
    # def render_unprocessable_entity_response(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    # end
end
