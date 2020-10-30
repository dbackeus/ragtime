require "rails_helper"

describe RagasController do
  render_views

  before { create_raga }

  describe "GET #index" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    context "with a filter" do
      it "should be successful" do
        get :index, filter: { thaat: "Kafi" }
        response.should be_success
      end
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
