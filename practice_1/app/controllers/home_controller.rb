class HomeController < ApplicationController
  def index
  end
  def write
    @title = params[:title]
    @address = params[:address]
    @content = params[:content]
  end
end