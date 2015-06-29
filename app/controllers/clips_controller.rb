class ClipsController < ApplicationController
  def create
    @clip = Clip.new(clip_params)
    @raga = Raga.find(@clip.raga_id)

    if @clip.save
      expire_fragment "all_ragas"
      redirect_to @raga, notice: "The clip was successfully added"
    else
      flash.now[:error] = "Failed to add clip. Please make sure it's a valid YouTube URL"
      render "ragas/show"
    end
  end

  private
  def clip_params
    params.require(:clip).permit(:url, :raga_id)
  end
end
