class SchedulesController < ApplicationController
  def index
    @projects = ProjectFinder.call
  end
end
