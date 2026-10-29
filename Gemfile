source "https://rubygems.org"

gem "jekyll", "~> 4.4"

# Windows and JRuby do not include zoneinfo files, so bundle the tzinfo-data gem
platforms :windows, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Lets `jekyll serve` notice file changes efficiently on Windows
gem "wdm", "~> 0.2", platforms: [:windows]

# Removed from Ruby's default gems in 3.4; Jekyll still needs them
gem "csv"
gem "base64"
gem "bigdecimal"
gem "logger"
