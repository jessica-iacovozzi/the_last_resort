class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @spells = Spell.all
  end
end
