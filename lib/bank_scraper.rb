require 'mechanize'

module BankScraper

  class LoginError < Exception
  end

  class CuentaCorriente
    attr_accessor :numero
    def initialize(numero)
      @numero = numero
    end

    def ==(other)
      numero == other.numero
    end
  end

  class TarjetaDeCredito
    attr_accessor :ultimos_digitos
    def initialize(ultimos_digitos)
      @ultimos_digitos = ultimos_digitos
    end

    def ==(other)
      ultimos_digitos == other.ultimos_digitos
    end
  end

  module TBanc
    class Sesion
      def initialize(rut, password)
        @rut = rut
        @password = password
      end

      def agent
        @agent ||= Mechanize.new
      end

      def login
        login_page = agent.get("https://www.tbanc.cl")
        form = login_page.form_with(:name => 'loginForm')
        form.field_with(:name => /username/).value = @rut
        form.field_with(:name => /password/).value = @password
        main_page = form.submit
        raise BankScraper::LoginError if main_page.title != 'TBanc Clientes'
        main_page
      end

      def cuentas_corrientes
        page = login
        page.forms[0].field_with(:name => /selectedAccountNr/).options.map do |option|
          BankScraper::CuentaCorriente.new(option.text.strip)
        end
      end

      def tarjetas_de_credito
        page = login
        page.forms[2].field_with(:name => /selectedAccountNr/).options.map do |option|
          BankScraper::TarjetaDeCredito.new(option.text.strip[-4..-1])
        end
      end


    end
  end
end
