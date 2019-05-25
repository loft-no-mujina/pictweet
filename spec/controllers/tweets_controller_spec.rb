require 'rails_helper'

describe TweetsController, type: :controller do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :edit template" do
    end
  end
end
