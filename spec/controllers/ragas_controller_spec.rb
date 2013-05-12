require "spec_helper"

describe RagasController do
  render_views

  before { create_raga }

  describe "GET #index" do
    before { get :index }

    it "should be successful" do
      response.should be_success
    end
  end

  describe "GET #show" do
    before { get :show, id: Raga.first.to_param }

    it "should be successfull" do
      response.should be_success
    end
  end

  private
  def create_raga
    Raga.create!(
        title: "Durga",
        ascending_scale: "S - R - m - P - D - S",
        descending_scale: "S - D - P - m - R - S",
        chakra: "heart",
        time: "6",
        spotify_playlist_url: "spotify:user:duztdruid:playlist:4MTwYDX13ovb6Jci1Ssxa9",
      )
  end
end