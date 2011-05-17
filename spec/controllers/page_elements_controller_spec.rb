require 'spec_helper'

describe PageElementsController do
  before :each do
    Project.stub(:default) { mock_project(:layout=>'norcalfreediving', :page_elements => mock_page_elements) }
    Project.stub(:find) { mock_project }
    Page.should_receive(:find).with(any_old(Page).id) {any_old(Page, :elements => mock_page_elements)}  
  end
  
  def mock_page_elements
    @mock_page_elements ||= pageable(any_old(PageElement))
  end

  describe "GET index" do
    it "assigns all page_elements as @page_elements" do
      get :index, :page_id => any_old(Page).id
      assigns(:page_elements).should eq(mock_page_elements)
    end
  end

  describe "GET show" do
    it "assigns the requested page_element as @page_element" do
      PageElement.stub(:find).with("37") { any_old(PageElement) }
      get :show, :id => "37", :page_id => any_old(Page).id
      assigns(:page_element).should be(any_old(PageElement))
    end
  end

  describe "GET new" do
    it "assigns a new page_element as @page_element" do
      PageElement.should_receive(:new) { any_old(PageElement) }
      get :new, :page_id => any_old(Page).id
      assigns(:page_element).should be(any_old(PageElement))
    end
  end

  describe "GET edit" do
    it "assigns the requested page_element as @page_element" do
      PageElement.stub(:find).with("37") { any_old(PageElement) }
      get :edit, :id => "37", :page_id => any_old(Page).id
      assigns(:page_element).should be(any_old(PageElement))
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created page_element as @page_element" do
        PageElement.stub(:new).with({'these' => 'params'}) { any_old(PageElement, :save => true) }
        post :create, :page_id => any_old(Page).id, :page_element => {'these' => 'params'}
        assigns(:page_element).should be(any_old(PageElement))
      end
      
      it "assigns the new page_element to the current project" do
        PageElement.stub(:new).with({'these' => 'params'}) { any_old(PageElement, :save => true) }
        any_old(PageElement).should_receive(:page=).with(any_old(Page))
        post :create, :page_element => {'these' => 'params'}, :page_id => any_old(Page).id
      end

      it "redirects to the created page_element" do
        PageElement.stub(:new) { any_old(PageElement, :save => true) }
        post :create, :page_element => {}, :page_id => any_old(Page).id
        response.should redirect_to(page_elements_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page_element as @page_element" do
        PageElement.stub(:new).with({'these' => 'params'}) { any_old(PageElement, save_should_fail) }
        post :create, :page_element => {'these' => 'params'}, :page_id => any_old(Page).id
        assigns(:page_element).should be(any_old(PageElement))
      end

      it "re-renders the 'new' template" do
        PageElement.stub(:new) { any_old(PageElement, save_should_fail) }
        post :create, :page_element => {}, :page_id => any_old(Page).id
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page_element" do
        PageElement.stub(:find).with("37") { any_old(PageElement) }
        any_old(PageElement).should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :page_element => {'these' => 'params'}, :page_id => any_old(Page).id
      end

      it "assigns the requested page_element as @page_element" do
        PageElement.stub(:find) { any_old(PageElement, :update_attributes => true) }
        put :update, :id => "1", :page_id => any_old(Page).id
        assigns(:page_element).should be(any_old(PageElement))
      end

      it "redirects to the page_element" do
        PageElement.stub(:find) { any_old(PageElement, :update_attributes => true) }
        put :update, :id => "1", :page_id => any_old(Page).id
        response.should redirect_to(page_elements_url)
      end
    end

    describe "with invalid params" do
      it "assigns the page_element as @page_element" do
        PageElement.stub(:find) { any_old(PageElement, update_should_fail) }
        put :update, :id => "1", :page_id => any_old(Page).id
        assigns(:page_element).should be(any_old(PageElement))
      end

      it "re-renders the 'edit' template" do
        PageElement.stub(:find) { any_old(PageElement, update_should_fail) }
        put :update, :id => "1", :page_id => any_old(Page).id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page_element" do
      PageElement.stub(:find).with("37") { any_old(PageElement) }
      any_old(PageElement).should_receive(:destroy)
      delete :destroy, :id => "37", :page_id => any_old(Page).id
    end

    it "redirects to the page_elements list" do
      PageElement.stub(:find) { any_old(PageElement) }
      delete :destroy, :id => "1", :page_id => any_old(Page).id
      response.should redirect_to(page_elements_url)
    end
  end
end
