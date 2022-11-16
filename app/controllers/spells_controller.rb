class SpellsController < ApplicationController
  def index
    @spells = Spell.all
    images
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

  def images
    @background_img = [
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616924/spell%20images/vera-velichko-potions-poison-skull-wallpaper_vornxb.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617000/spell%20images/2306148a6826c3849554ff6e82f358c0_tm8orh.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616976/spell%20images/bdf4e8e60c1fedae47811e60754532c1_hnmf8b.png'
    ]

    @user_img = [
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617351/spell%20images/users/09-angela_wj9jud.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/01-dimitri_gjcpcp.jpg', 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/02-tanya_ilefnh.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/08-patt_rffvlp.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/03-steve_uaz0jx.jpg'
    ]
  end
end
