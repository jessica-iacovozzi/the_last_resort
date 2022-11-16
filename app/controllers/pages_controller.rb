class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @spells = Spell.all

    @background_img = [
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616924/spell%20images/vera-velichko-potions-poison-skull-wallpaper_vornxb.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617000/spell%20images/2306148a6826c3849554ff6e82f358c0_tm8orh.jpg',
      'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616976/spell%20images/bdf4e8e60c1fedae47811e60754532c1_hnmf8b.png'
    ]
    @user_img = ['']
  end
end
