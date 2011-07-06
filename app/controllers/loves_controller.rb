class LovesController < ActionController::Base
  respond_to :js
  helper :love
  
  def create
    @love = Love.create( :member_id => current_member.id, :loveable_id => params[:loveable_id], :loveable_type => params[:loveable_type]) unless current_member.nil?
    respond_with @love
  end
  
end
     
