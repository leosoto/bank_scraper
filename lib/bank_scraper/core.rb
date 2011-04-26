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
end
