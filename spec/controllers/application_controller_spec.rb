require 'spec_helper'

describe SitesController do
  it "ApplicationController loads current site" do
    @current_site = mock_model(Site).as_null_object
    request.env['SERVER_NAME'] = 'whisper.com'
    Site.should_receive(:find).with(:first, {:conditions=>{:domain=>"whisper.com"}}) {@current_site}
    Site.stub(:find).with("37") {john_q(:site)}
    get :show, :id => "37"
    assigns(:current_site).should be(@current_site)
  end
end
