require 'spec_helper'

describe PagesController do
  before :each do
    
  end

  describe "GET index" do
    it "assigns all pages as @pages" do
      Page.stub(:find).with(:all) { [john_q(:page)] }
      get :index
      
      assigns(:pages).should eq([john_q(:page)])
      
    end
  end

  describe "GET show" do
    it "assigns the requested page as @page" do
      Page.stub(:find).with("37") { john_q(:page) }
      get :show, :id => "37"
      assigns(:page).should be(john_q(:page))
    end
  end

  describe "GET new" do
    it "assigns a new page as @page" do
      Page.stub(:new) { john_q :page }
      get :new
      assigns(:page).should be(john_q(:page))
    end
  end

  describe "GET edit" do
    it "assigns the requested page as @page" do
      Page.stub(:find).with("37") { john_q(:page) }
      get :edit, :id => "37"
      assigns(:page).should be(john_q(:page))
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created page as @page" do
        Page.stub(:new) { john_q :Page, :save => true }
        post :create, :page => {'these' => 'params'}
        assigns(:page).should be(john_q(:page))
      end

      it "redirects to the created page" do
        Page.stub(:new) { john_q :Page, :save => true }
        post :create, :page => {}
        response.should redirect_to(page_url(john_q(:page)))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page as @page" do
        Page.stub(:new) { john_q :Page, :save => false }
        post :create, :page => {'these' => 'params'}
        assigns(:page).should be(john_q(:page))
      end

      it "re-renders the 'new' template" do
        Page.stub(:new) { john_q :Page, :save => false }
        john_q(:page).stub_chain("errors.empty?") {false}
        post :create, :page => {}
        response.should render_template("")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      before :each do
        Page.should_receive(:find).with("37") { john_q(:page, :update_attributes => true) }
      end
      it "updates the requested page" do
        john_q(:page).should_receive(:update_attributes).with({'these' => 'params'}) {true}
        put :update, :id => "37", :page => {'these' => 'params'}
      end

      it "assigns the requested page as @page" do
        put :update, :id => "37"
        assigns(:page).should be(john_q(:page))
      end

      it "redirects to the page" do
        put :update, :id => "37"
        response.should redirect_to(page_url(john_q(:page)))
      end
    end

    describe "with invalid params" do
      before :each do
        Page.should_receive(:find).with("37") { john_q(:page, :update_attributes => false) }
        john_q(:page).stub_chain("errors.empty?") {false}
      end
      it "assigns the page as @page" do
        put :update, :id => "37"
        assigns(:page).should be(john_q(:page))
      end

      it "re-renders the 'edit' template" do
        put :update, :id => "37"
        response.should render_template("")
      end
    end

  end

  describe "DELETE destroy" do
    before :each do
      Page.should_receive(:find).with("37") { john_q(:page) }
      john_q(:page).stub_chain("errors.empty?") {false}
    end
    it "destroys the requested page" do
      john_q(:page).should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pages list" do
      delete :destroy, :id => "37"
      response.should redirect_to(pages_url)
    end
  end

end
