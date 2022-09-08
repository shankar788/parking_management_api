class SlotsController < ApplicationController
    def create
        authorize! :create , Slot
        @floor = Floor.find(params[:floor_id])
        if params[:slot][:slot_number].to_i<=10
            if @floor.slots.create(slot_params)
                render json: { message: "slot #{params[:slot][:slot_number]} created " }
            end
        else
            render json: { message: "You can not create more than 10 slot each floor" }    
        end    
    end    
     
    def update
        @floor = Floor.find(params[:floor_id])
        @slot_id = Slot.find(params[:id])
        @a = @floor.slots.find_by(id:@slot_id)
        if @a.car_number == nil 
            @a.update(slot_params)
            @a.update(user_id:current_user.id)
            @a.update(status:"Booked")
            @a.update(in_time:Time.now)
            render json: { message: "Slot Updated" }
        else  
            render json: { message: "Slot not Epmty" }
        end    
    end    

    def index
        @floor = Floor.find(params[:floor_id])
        @floor_slots = @floor.slots.all
        render json:@floor_slots7   
    end    

    def park_in
        @floor = Floor.find(params[:floor_id])
    end    

    private
    def slot_params
      params.require(:slot).permit(:car_number,:car_color,:in_time,:out_time,:user_id,:slot_number,:in_time,:status)
    end
end

