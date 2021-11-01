class RoomsController < ApplicationController
  def index
    render json: Room.all.as_json(include: :devices)
  end

  def create
    room = Room.new(permitted_params)

    room.save && render(json: :ok) || render_errors(room)
  end

  def destroy
    room = Room.find(params[:id])

    room.destroy
    room.devices.destroy_all

    render json: :ok
  end

  private

  def permitted_params
    params.require(:room).permit(:name)
  end
end
