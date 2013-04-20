class LightsController < ApplicationController

  def show
    
  end

  def switch
    pin = PiPiper::Pin.new(pin: 17)
    pin.on if params[:transition] == "on"
    pin.off if params[:transition] == "off"
    render nothing: true
  end
end
