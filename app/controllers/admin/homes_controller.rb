class Admin::HomesController < AdminsController
  def top
    @users = User.all
  end
end
