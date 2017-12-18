class SchedulesController < ApplicationController
  def index
    @schedule = TodayScheduleFacade.new
  end
end
