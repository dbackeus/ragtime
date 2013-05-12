class ClipsController < ApplicationController
  def create
    @clip = Clip.new(clip_params)
    @raga = Raga.find(@clip.raga_id)
    @clips = @raga.clips
    
    if @clip.save
      flash[:notice] = "The clip was successfully added"
      redirect_to @raga
    else
      render "ragas/show"
    end
  end

  private
  def clip_params
    params.require(:clip).permit(:url, :raga_id)
  end
end
