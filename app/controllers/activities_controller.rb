class ActivitiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index 
        activity = Activity.all 
        render json: activity, status: :ok
    end

    def destroy 
        act = Activity.find_by!(id: params[:id])
        act.destroy
        head :no_content
    end


    private 

    def not_found 
        render json: {error: "Activity not found"}, status: :not_found
    end
end
