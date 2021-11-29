class ReservaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reserva_mailer.enviar_confirmacion.subject
  #
  def enviar_confirmacion
    @greeting = "Hi"

    mail to: "agonzalez1554@gmail.com"
  end
end
