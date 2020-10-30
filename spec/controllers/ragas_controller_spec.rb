require "rails_helper"

describe RagasController do
  render_views

  before { create_raga }

  describe "GET #index" do
    it "should be successful" do
      get :index
      response.status.should == 200
    end

    context "with a filter" do
      it "should be successful" do
        get :index, params: { filter: { thaat: "Kafi" } }
        response.status.should == 200
      end
    end
  end

  describe "GET #show" do
    it "should be successfull" do
      get :show, params: { id: Raga.first.to_param }
      response.status.should == 200
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
