class LeaguesController < ApplicationController

  def index
    @leagues = League.all.order(:id)
  end

  def show
    @league = League.find(params[:id])
  end
end
