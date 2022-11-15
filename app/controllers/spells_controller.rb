class SpellsController < ApplicationController
  def index
    @spells = Spell.all
  end

  def new
  end

  def create
  end
end
