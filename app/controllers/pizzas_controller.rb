class PizzasController < ApplicationController
    
    def index   
        pizza = Pizza.all
        render json: pizza
    end
end
