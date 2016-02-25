class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :discover]
  skip_after_action :verify_authorized, only: :home

  def home
    @invited = User.new
  end


  def discover
    @kit = Kit.current
    # utilisation d'un form tag avec récupération des params de la vue dans le controller

    # vérification du coupon valide
    #if @coupon.number.valid?
      # exécuter le code ci-après, à remettre ici donc
    #else
      #render :new
    #end
    #
    # création du user et génération mot de passe automatique à la facebook
    # @user = User.new(user_params)
    # @user.password = Devise.friendly_token[0,20]

    # # création adresse (ne pas oublier le sujet de l'autocomplete)
    # @address = Address.new
    # @address = @user.addresss.build(address_params)

    # # méthode post et redirect vers checkout
    # if @user.save && address.save
    #   redirect_to edit_checkout_address_path
    # else
    #   render :new
    # end

  end


 private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def address_params
    params.require(:address).permit(:email)
  end

  def coupons_params
    params.require(:coupons).permit(:number)
  end
end
