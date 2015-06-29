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

  def suggestion
    session[:time_zone_offset] = params[:time_zone_offset].to_i.hours

    render partial: "suggestion"
  end
end
