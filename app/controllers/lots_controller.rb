class LotsController < ApplicationController

     def index
      @lots = Lot.all
      end

    def new
      @lot = Lot.new
    end
   

      def create
        @lot = Lot.create(lot_params)
        if @lot.valid?
           redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      private

      def lot_params
        params.require(:lot).permit(:name, :address, :description)
      end

end
