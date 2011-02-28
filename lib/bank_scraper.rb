require 'mechanize'

module BankScraper
  
  class LoginError < Exception
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
      
      def cuentas_corriente
        
      end
    end
    
    class CuentaCorriente
      def saldo_disponible
        raise NotImplementedError
      end
      
      def saldo_contable
      end
    end
  end
end
