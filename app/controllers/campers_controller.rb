class CampersController < ApplicationController 
        rescue_from ActiveRecord::RecordNotFound, with: :not_found 


    def index 
        campers = Camper.all 
        render json: campers, status: :ok
    end

    def show 
        camper = Camper.find_by!(id: params[:id])
        render json: camper, serializer: CamperActivitiesSerializer, status: :ok
    end 

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
        rescue ActiveRecord::RecordInvalid => invalid
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private 
     def camper_params 
        params.permit(:name, :age)
     end
     def not_found 
    render json: {error: "Camper not found"}, status: :not_found
    end
    
   
end
