class Api::V1::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    if @categories.empty?
      render json: { data: [] }, status: :ok
    else
      render json: @categories, status: :ok
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: { error: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    params.permit(:name, :color, :icon)
  end
end
