class HomeController < ApplicationController
  def home
  	@report = Report.new
  	@reports = Report.all
 
  end

  def contact
  end
end
