class CourtsController < ApplicationController
  before_action :authenticate_user!
  def index
    courts = Court.all 
  end

  def new
    court = Court.new
  end
def create
  @court = Court.new(court_params)
  if @court.save
    redirect_to court_path(@court)
  else
    render :new
  end
end
  def show
    court = Court.find(params[:id])
  end

  def edit
    court = Court.find(params[:id])
  end
  def update
    @court = Court.find(court_params)
    if @court.update
      redirect_to court_path
    else 
  end

  private
  def court_params
    params.require(:court).permit(:tamaño, :fecha, :hora)
  end

end
