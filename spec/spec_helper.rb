require 'lib/bank_scraper'
CREDENTIALS = YAML::parse(File.read(File.join(File.dirname(__FILE__), "credentials.yaml")))