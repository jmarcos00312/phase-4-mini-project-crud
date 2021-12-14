class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


def index
    spices = Spice.all
    render json: spices
end

def create
    spices = Spice.create(params_create)
    render json:spices, status: :created
end

def update
    spices = find_spices
    spices.update(params_create)
    render json:spices
end

def destroy
spices = find_spices
spices.destroy
render json:spices
end





private

def find_spices
    Spice.find(params[:id])

end

def params_create
    params.permit(:title, :image, :description, :notes, :rating)
end

def render_not_found
    render json: { error: 'Not Found'}, status: :not_found
end
end
