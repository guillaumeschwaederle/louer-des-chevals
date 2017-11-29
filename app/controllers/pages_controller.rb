class PagesController < ApplicationController
  skip_before_action :profile_present?
  def home
  end
end
