class LovesController < ActionController::Base
  helper :love
  
  def create
    @love = Love.create( :member_id => current_member.id, :loveable_id => params[:loveable_id], :loveable_type => params[:loveable_type]) unless current_member.nil?
  end
  
  def destroy
    @love = Love.where(:member_id => current_member.id, :loveable_id => params[:loveable_id], :loveable_type => params[:loveable_type]).first.destroy
    redirect_to :back
  end
end
     
