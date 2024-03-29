class LightsController < ApplicationController

  def show
    pin = PiPiper::Pin.new(pin: 17, direction: :out)
  end

  def switch
    pin = PiPiper::Pin.new(pin: 17, direction: :out)
    pin.on if params[:transition] == "on"
    pin.off if params[:transition] == "off"
    render nothing: true
  end
end
