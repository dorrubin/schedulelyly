class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end


  def new
		@reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  end

  def update
  	reservation = Reservation.find(params[:id])
    if reservation.update(reservation_params)
  		# redirect_to('/reservations/#{@reservation.id}')
  		redirect_to('/reservations')
  	else
  		render :edit
  	end

  end


  def create
  	@reservation = Reservation.new(reservation_params)
  	if @reservation.save
  		# redirect_to('/reservations/#{@reservation.id}')
  		redirect_to('/reservations')
  	else
  		render :new
  	end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:exam_id, :client_first_name, :client_last_name, :score, :datetime)
  end

end