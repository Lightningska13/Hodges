class DashController < ApplicationController
  def index
    @page_title= "Hand Crafted Fine Jewelry"
    @event= Event.find_for_home('Showcase', 'desc').first
    @showpic = @event.eventpic_file_name unless @event.nil?
  end  
end
