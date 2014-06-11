class StaticController < ApplicationController
  def home
    render layout: 'home'
  end

  def terms_conditions
    render layout: 'home'
  end
end
