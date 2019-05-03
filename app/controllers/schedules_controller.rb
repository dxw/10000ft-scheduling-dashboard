class SchedulesController < ApplicationController

  before_action :check_we_can_login

  def check_we_can_login
    if error = TenkftClientWrapper.client.error_message
      flash[:error] = error
      render 'layouts/application'
    end
  end

  def index
    @schedule = TodayScheduleFacade.new
  end
end
