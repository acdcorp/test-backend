# Access an environment variable or raise a runtime error
# if it can't be found.
$env = ->(name) {
  ENV.fetch(name) do
    raise(sprintf("Missing ENV['%s']", name))
  end
}

# Load environment variables
%W{.env .env.#{ENV['RACK_ENV']}}.each do |file|
  File.foreach file do |line|
    key, value = line.split "=", 2; ENV[key] = value.gsub('\n', '').strip
  end if File.file? file
end
