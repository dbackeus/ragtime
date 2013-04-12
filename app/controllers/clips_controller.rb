class ClipsController < ApplicationController
  def create
    @clip = Clip.new(params[:clip])
    @raga = @clip.raga
    
    if @clip.save
      flash[:notice] = "The clip was successfully added"
      redirect_to @raga
    else
      render "ragas/show"
    end
  end
end
