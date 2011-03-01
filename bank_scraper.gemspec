# -*- encoding: utf-8 -*-
require File.expand_path("../lib/bank_scraper/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bank_scraper"
  s.version     = BankScraper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Leo Soto M."]
  s.email       = ["leo.soto@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/bankscrapper"
  s.summary     = "Scrapper for Chilean banks' web pages"
  s.description = "Provides a common API to access bank account data"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "bank_scraper"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.4.0"
  s.add_development_dependency "ephemeral_response", ">= 0.4.0"
  s.add_runtime_dependency "mechanize", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
