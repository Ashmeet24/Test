class PlacesController < ApplicationController
	def index
		@place = Place.all
		render json: {:Place => @places}
end

def create
	@place= Place.create(place_params)
	if @place.save
		render json: {responsecode:200, responsemessage:"Successfull" }
    else
    	render json:{responsecode:400, responsemessage:"Bad request"}
    end
end
private

def place_params
	params.require(:place).permit(:liked_place)
end 
end