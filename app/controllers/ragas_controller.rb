class RagasController < ApplicationController
  def index
    @order = params[:order] || "title"
  end

  def show
    @raga = Raga.find_by(url: params[:id])
    @clip = Clip.new(raga: @raga)
  end

  def suggestion
    session[:time_zone_offset] = params[:time_zone_offset].to_i.hours

    render partial: "suggestion"
  end

  private

  def ragas
    conditions = params[:filter] || {}
    @ragas = Raga.where(conditions).order_by("#{@order} ASC")
  end
  helper_method :ragas
end
