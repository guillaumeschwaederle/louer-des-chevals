class PagesController < ApplicationController
  def home
    @chevals = Cheval.all
  end
end
