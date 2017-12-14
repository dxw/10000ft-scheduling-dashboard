class SchedulesController < ApplicationController
  def index
    @facade = TodayScheduleFacade.new
  end
end
