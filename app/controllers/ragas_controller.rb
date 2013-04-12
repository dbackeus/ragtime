class RagasController < ApplicationController
  def index
    @order = params[:order] || "title"
    conditions = params[:filter] || {}
    @ragas = Raga.where(conditions).order_by("#{@order} ASC")
  end

  def show
    @raga = Raga.find_by(url: params[:id])
    @clips = Clip.where(raga: @raga)
    @clip = Clip.new(:raga => @raga)
  end

  def new
    @raga = Raga.new
  end

  def edit
    @raga = Raga.find_by(url: params[:id])
  end

  def create
    @raga = Raga.new(params[:raga])
    
    if @raga.save
      flash[:notice] = 'Raga was successfully created.'
      redirect_to(@raga)
    else
      render "new"
    end
  end

  def update
    @raga = Raga.find_by(url: params[:id])

    if @raga.update_attributes(params[:raga])
      flash[:notice] = 'Raga was successfully updated.'
      redirect_to(@raga)
    else
      render "edit"
    end
  end

  def destroy
    @raga = Raga.find_by(url: params[:id])
    @raga.destroy
    flash[:notice] = 'Raga was successfully deleted.'
    redirect_to(ragas_url)
  end
  
  def suggestion
    session[:time_zone_offset] = params[:time_zone_offset].to_i.hours
    render :partial => "suggestion"
  end
end
