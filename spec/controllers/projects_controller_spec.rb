require 'spec_helper'

describe ProjectsController do
  before :each do
    
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      Project.stub(:find).with(:all) { [john_q(:project)] }
      get :index
      
      assigns(:projects).should eq([john_q(:project)])
      
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      Project.stub(:find).with("37") { john_q(:project) }
      get :show, :id => "37"
      assigns(:project).should be(john_q(:project))
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      Project.stub(:new) { john_q :project }
      get :new
      assigns(:project).should be(john_q(:project))
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      Project.stub(:find).with("37") { john_q(:project) }
      get :edit, :id => "37"
      assigns(:project).should be(john_q(:project))
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created project as @project" do
        Project.stub(:new) { john_q :Project, :save => true }
        post :create, :project => {'these' => 'params'}
        assigns(:project).should be(john_q(:project))
      end

      it "redirects to the created project" do
        Project.stub(:new) { john_q :Project, :save => true }
        post :create, :project => {}
        response.should redirect_to(project_url(john_q(:project)))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        Project.stub(:new) { john_q :Project, :save => false }
        post :create, :project => {'these' => 'params'}
        assigns(:project).should be(john_q(:project))
      end

      it "re-renders the 'new' template" do
        Project.stub(:new) { john_q :Project, :save => false }
        john_q(:project).stub_chain("errors.empty?") {false}
        post :create, :project => {}
        response.should render_template("")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      before :each do
        Project.should_receive(:find).with("37") { john_q(:project, :update_attributes => true) }
      end
      it "updates the requested project" do
        john_q(:project).should_receive(:update_attributes).with({'these' => 'params'}) {true}
        put :update, :id => "37", :project => {'these' => 'params'}
      end

      it "assigns the requested project as @project" do
        put :update, :id => "37"
        assigns(:project).should be(john_q(:project))
      end

      it "redirects to the project" do
        put :update, :id => "37"
        response.should redirect_to(project_url(john_q(:project)))
      end
    end

    describe "with invalid params" do
      before :each do
        Project.should_receive(:find).with("37") { john_q(:project, :update_attributes => false) }
        john_q(:project).stub_chain("errors.empty?") {false}
      end
      it "assigns the project as @project" do
        put :update, :id => "37"
        assigns(:project).should be(john_q(:project))
      end

      it "re-renders the 'edit' template" do
        put :update, :id => "37"
        response.should render_template("")
      end
    end

  end

  describe "DELETE destroy" do
    before :each do
      Project.should_receive(:find).with("37") { john_q(:project) }
      john_q(:project).stub_chain("errors.empty?") {false}
    end
    it "destroys the requested project" do
      john_q(:project).should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the projects list" do
      delete :destroy, :id => "37"
      response.should redirect_to(projects_url)
    end
  end

end
