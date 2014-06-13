class AccountController < ApplicationController

  def credit_card
    
  end

  def process_credit_card
    
    charge = Stripe::Charge.create(
      :amount => current_account.plan.price.to_i * 100,
      :currency => "usd",
      :card => params[:stripe_token],
      :description => "Plan #{current_account.plan.name} ($#{current_account.plan.price})"
    )

    current_account.update(stripe_charge: charge.id) if charge.paid

    flash[:breaking_alert] = nil
    redirect_to dashboard_path, notice: 'Tu pago fue procesado con éxito. Bienvenido a Lanzamiento Global!'

    rescue Stripe::CardError => e
      redirect_to account_credit_card_path, error: e.message

    rescue Stripe::StripeError => e
      redirect_to account_credit_card_path, error: e.message
  end

end
