class DashboardController < ApplicationController

  def show
    @user = record.user
  end

end
