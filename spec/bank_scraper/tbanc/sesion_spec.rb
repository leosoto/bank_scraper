require 'spec_helper'

describe BankScraper::TBanc::Sesion do
  context "with correct credentials" do
    subject do
      BankScraper::TBanc::Sesion.new(
        CREDENTIALS["tbanc"]["username"].value,
        CREDENTIALS["tbanc"]["password"].value
      )
    end
    
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