class WornsController < ActionController::Base
  helper :worn
  
  def create
    @worn = Worn.create( :member_id => current_member.id, :wornable_id => params[:wornable_id], :wornable_type => params[:wornable_type], :kind => params[:kind]) unless current_member.nil?
  end
  
end
     
