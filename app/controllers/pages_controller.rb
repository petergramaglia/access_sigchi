class PagesController < ApplicationController
  def home
    
  end
  def tool
    @title = "Tool"
  end
  def about
    @title = "About us"
  end
end
