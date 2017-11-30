class PagesController < ApplicationController
  skip_before_action :profile_present?
  def home
    @chevals = Cheval.all
  end
end
