class InquiriesController < ApplicationController
  respond_to :html, :js

  def index
    @inquiries = @project.inquiries.order_by([[:name, :asc]]).page(params[:page])
    respond_with @inquiries
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    respond_with @inquiry
  end

  def new
    @inquiry = Inquiry.new
    respond_with @inquiry
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
    respond_with @inquiry
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    @inquiry.project = @project
    if @inquiry.save
      flash[:notice] = "Thanks for taking the time to ask us!  We'll answer your question as soon as possible."
      InquiryMailer.submit_inquiry(@inquiry, @project).deliver
    end
    
    respond_with(@inquiry, :location => new_inquiry_path)
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update_attributes(params[:inquiry])
    respond_with(@inquiry)
  end
  
  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    respond_with @inquiry, :location => inquiries_path
  end
end
