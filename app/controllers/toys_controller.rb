# frozen_string_literal: false

# Toys model controller
class ToysController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  wrap_parameters format: []

  def index
    render json: Toy.all, status: :ok
  end

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find(params[:id])
    toy.update!(toy_params)
    render json: toy, status: :created
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    head :no_content
  end

  private

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  def toy_params
    params.permit(:name, :image, :likes)
  end
end
