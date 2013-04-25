class ClipsController < ApplicationController
  def create
    @clip = Clip.new(params[:clip])
    @raga = Raga.find(@clip.raga_id)
    @clips = @raga.clips
    
    if @clip.save
      flash[:notice] = "The clip was successfully added"
      redirect_to @raga
    else
      render "ragas/show"
    end
  end
end
