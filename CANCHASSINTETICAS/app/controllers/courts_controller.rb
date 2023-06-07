class CourtsController < ApplicationController
  def index
    @courts = Court.all 
  end

  def new
    @court = Court.new
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
    @court = Court.find(params[:id])
  end

  def edit
    @court = Court.find(params[:id])
  end
  def update
    @court = Court.find(params[:id])
    if @court.update(court_params)
      redirect_to court_path(@court)
    else 
      render :edit
    end
  end

  private
  def court_params
    params.require(:court).permit(:tamaño, :fecha, :hora)
  end

end
