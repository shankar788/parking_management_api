class FloorsController < ApplicationController
  
    def create
      authorize! :create , Floor
      @n = Floor.new(article_params)
      if @n.save
        render json: { message: "Success" }
      else
        render json: { message: "failed" }
      end  
    end
    
    def index
      @floors = Floor.all
      render json:@floors
    end  

    def show
      @floor = Floor.find(params[:id])
      render json:@floor.slots.all
    end  
    
    private
    def article_params
      params.require(:floor).permit(:number)
    end
end
