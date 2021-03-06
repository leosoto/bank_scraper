require 'spec_helper'

describe BankScraper::TBanc::Sesion do
  subject do
    BankScraper::TBanc::Sesion.new(
      CREDENTIALS["tbanc"]["username"].value,
      CREDENTIALS["tbanc"]["password"].value
    )
  end

  describe "#login" do
    context "with correct credentials" do
      it "logs in correctly" do
        subject.login
      end
    end

    context "with incorrect credentials" do
      subject { BankScraper::TBanc::Sesion.new('11.111.111-1', '123456') }
      it "raises an exception when logging in" do
        lambda { subject.login }.should raise_error(BankScraper::LoginError)
      end
    end
  end

  describe "#cuentas_corrientes" do
    let(:account_number) do
      BankScraper::CuentaCorriente.new(CREDENTIALS["tbanc"]["cuenta"].value)
    end

    it "includes the account of the logged in person" do
      subject.cuentas_corrientes.should include(account_number)
    end

    context "for such account" do
      let(:cuenta_corriente) do
        subject.cuentas_corrientes.detect {|c| c.numero == account_number }
      end

      pending "has the available funds" do
        cuenta_corriente.saldo_disponible.should_not be_nil
        cuenta_corriente.saldo_contable.should_not be_nil
        cuenta_corriente.sobregiro_disponible.should_not be_nil
      end
    end

  end

  describe "tarjetas_de_credito" do
    let(:card) do
      BankScraper::TarjetaDeCredito.new(CREDENTIALS["tbanc"]["tarjeta_credito"].value)
    end

    it "inclues the credit card of the logged in person" do
      subject.tarjetas_de_credito.should include(card)
    end
  end
end