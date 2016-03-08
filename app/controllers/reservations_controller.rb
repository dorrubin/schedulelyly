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
  	pre = Reservation.find(params[:id])
    pre.datetime = nil
    @reservation = pre
  end

  def update
  	reservation = Reservation.find(params[:id])
  	formatted_time = format_time(reservation_params)
  	formatted_params = reservation_params.merge(:datetime => formatted_time).except("datetime(1i)", "datetime(2i)", "datetime(3i)", "datetime(4i)", "datetime(5i)")
    if reservation.update(formatted_params)
  		# redirect_to('/reservations/#{@reservation.id}')
  		redirect_to('/reservations')
  	else
  		render :edit
  	end

  end


  def create
  	formatted_time = format_time(reservation_params)
  	reservation_params[:datetime] = formatted_time;
  	formatted_params = reservation_params.merge(:datetime => formatted_time).except("datetime(1i)", "datetime(2i)", "datetime(3i)", "datetime(4i)", "datetime(5i)")
  	@reservation = Reservation.new(formatted_params)
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

  def format_time(params)
  	year   = params["datetime(1i)"].to_i
  	month  = params["datetime(2i)"].to_i
  	day    = params["datetime(3i)"].to_i
  	hour   = params["datetime(4i)"].to_i
  	second = params["datetime(5i)"].to_i
  	return DateTime.new(year, month, day, hour, second);
  end


end