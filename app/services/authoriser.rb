class Authoriser
  def initialize(cu)
    @current_user = cu
  end

  def authorised?(controller, action)
    if (controller == UsersController && [:index, :update, :edit].include?(action))
      @current_user && @current_user.admin?
    elsif (controller == UsersController && [:edit_own_profile, :update_own_profile].include?(action))
      @current_user.present?
    elsif (controller == FinesController && [:new, :create].include?(action))
      @current_user.present?
    elsif (controller == FinesController && [:edit, :destroy].include?(action))
      @current_user && @current_user.admin?
    elsif (controller == FinesController && action == :index)
      true
    elsif (controller == VotesController && [:up, :down].include?(action)) 
      @current_user.present?
    elsif (controller == SessionsController && [:create, :new, :destroy].include?(action))
      true
    end
      
  end
end


