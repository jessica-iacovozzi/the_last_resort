class SpellsController < ApplicationController
  def index
    @spells = Spell.all
  end

  def my_spells
    @spells = Spell.where(user_id: current_user)
  end

  def new
    @spell = Spell.new
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def create
    @spell = Spell.new(spell_params)
    @spell.user = current_user
    if @spell.save
      redirect_to spell_path(@spell), notice: "Your spell was created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spell_params
    params.require(:spell).permit(:name, :category, :description, :location, :price)
  end
end
