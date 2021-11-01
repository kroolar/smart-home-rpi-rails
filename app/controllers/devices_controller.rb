class DevicesController < ApplicationController
  def index
    @devices = Device.all.as_json(methods: :outputs)

    RPi::GPIO.set_numbering :bcm
    
    @devices.each do |device|
      RPi::GPIO.setup device.gpio, :as => :output #, :initialize => :low

      device.state &&
        RPi::GPIO.set_high(device.gpio) ||
        RPi::GPIO.set_low(device.gpio)
    end

    render json: @devices
  end

  def create
    device = Device.new(permitted_params)

    device.save && render(json: :ok) || render_errors(device)
  end

  def destroy
    device = Device.find(params[:id])

    device.destroy

    render json: :ok
  end

  def update
    device = Device.find(params[:id])

    device.update(state: params[:state])

    render json: :ok
  end

  private

  def permitted_params
    params.require(:device).permit(
      :name,
      :gpio,
      :icon,
      :room_id
    )
  end
end
