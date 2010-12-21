require 'spec_helper'

describe SitesController do
  before :each do
    @current_site = mock_model(Site).as_null_object
    request.env['SERVER_NAME'] = 'whisper.com'
    Site.should_receive(:find).with(:first, {:conditions=>{:domain=>"whisper.com"}}) {@current_site}
  end
  
  describe "GET index" do
    it "assigns all sites as @sites" do
      Site.should_receive(:find).with(:all) { [john_q(:site)] }
      get :index
      assigns(:sites).should eq([john_q(:site)])
    end
  end

  describe "GET show" do
    it "assigns the requested site as @site" do
      Site.should_receive(:find).with("37") {john_q(:site)}
      get :show, :id => "37"
      assigns(:site).should be(john_q(:site))
    end

  end

  describe "GET new" do
    it "assigns a new site as @site" do
      Site.stub(:new) { john_q(:site)}
      get :new
      assigns(:site).should be(john_q(:site))
    end
  end

  describe "GET edit" do
    it "assigns the requested site as @site" do
      Site.should_receive(:find).with("37") {john_q(:site)}
      get :edit, :id => "37"
      assigns(:site).should be(john_q(:site))
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created site as @site" do
        john_q(:site).stub(:save) {true}
        Site.stub(:new) { john_q(:site) }
        post :create, :site => {'these' => 'params'}
        assigns(:site).should be(john_q(:site))
      end

      it "redirects to the created site" do
        Site.stub(:new) { john_q :site, :save => true }
        post :create, :site => {}
        response.should redirect_to(site_url(john_q(:site)))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        john_q(:site).stub(:save) {false}
        Site.stub(:new) { john_q(:site)}
        post :create, :site => {'these' => 'params'}
        assigns(:site).should be(john_q(:site))
      end

      it "re-renders the 'new' template" do
        Site.stub(:new) { john_q :site, :save => false }
        john_q(:site).stub_chain("errors.empty?") {false}
        post :create, :site => {}
        response.should render_template("")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      before :each do
        Site.should_receive(:find).with("37") { john_q(:site) }
        john_q(:site).should_receive(:update_attributes).with({'these' => 'params'}) {true}
      end
      it "updates the requested site" do
        put :update, :id => "37", :site => {'these' => 'params'}
      end

      it "assigns the requested site as @site" do
        put :update, :id => "37", :site => {'these' => 'params'}
        assigns(:site).should be(john_q(:site))
      end

      it "redirects to the site" do
        put :update, :id => "37", :site => {'these' => 'params'}
        response.should redirect_to(site_url(john_q(:site)))
      end
    end

    describe "with invalid params" do
      before :each do
        Site.should_receive(:find).with("37") { john_q(:site) }
        john_q(:site).stub_chain("errors.empty?") {false}
      end
      it "assigns the site as @site" do
        put :update, :id => "37"
        assigns(:site).should be(john_q(:site))
      end

      it "re-renders the 'edit' template" do
        put :update, :id => "37"
        response.should render_template("")
      end
    end

  end

  describe "DELETE destroy" do
    before :each do
      Site.should_receive(:find).with("37") { john_q(:site) }
      john_q(:site).stub_chain("errors.empty?") {false}
    end
    it "destroys the requested site" do
      john_q(:site).should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sites list" do
      delete :destroy, :id => "37"
      response.should redirect_to(sites_url)
    end
  end

end
