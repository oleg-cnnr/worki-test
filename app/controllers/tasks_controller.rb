# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @collection = Task.all
  end

  def show
    @resource = Task.find(params[:id])
  end

  def new
    @resource = Task.new
    @resource.addresses.build
  end

  def create
    @resource = Task.new(resource_params)
    if @resource.save
      redirect_to task_path(@resource)
    else
      render :new
    end
  end

  def destroy
    @resource = Task.find(params[:id])
    @resource.destroy

    redirect_to tasks_path
  end

  private

  def resource_params
    permitted = [addresses_attributes: %i[id uri]]
    params.require(:task).permit(permitted)
  end
end
