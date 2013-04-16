# Load the rails application
require File.expand_path('../application', __FILE__)

# Load Github application secrets
begin
  YAML.load_file("#{::Rails.root}/config/github.yml")[::Rails.env].each {|k, v| ENV[k.upcase] = v }
rescue
  $stderr.puts "WARNING! Did not find a valid config/github.yml file. Github oauth will not work"
end

# Initialize the rails application
SeHackathon::Application.initialize!
