require 'lib/bank_scraper'
CREDENTIALS = YAML::parse(File.read(File.join(File.dirname(__FILE__), "credentials.yaml")))
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
