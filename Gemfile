# frozen_string_literal: true
source "https://rubygems.org"

ruby "3.3.8"                            # Pick a modern, supported version

########################################
# Core Rails stack
########################################
gem "rails", "~> 8.0.2"
gem "pg", "~> 1.5"                      # PostgreSQL adapter
gem "puma", ">= 5.0"                    # Web server
gem "propshaft"                         # Modern asset pipeline
gem "importmap-rails"                   # JS via ESM import maps
gem "turbo-rails"                       # Hotwire
gem "stimulus-rails"                    # Hotwire controllers
gem "jbuilder"                          # JSON responses / view models
gem "solid_cache"                       # DB‑backed cache
gem "solid_queue"                       # DB‑backed Active Job (side‑channel fallback)
gem "solid_cable"                       # DB‑backed Action Cable (fallback)

gem "cssbundling-rails", "~> 1.3"

########################################
# Production‑grade essentials
########################################
gem "devise"                            # Authentication
gem "pundit", "~> 2.3"                  # Authorization
gem "sidekiq"                           # Background jobs (adapter set in config)
gem "redis", "~> 4.0"                   # Sidekiq’s backend
gem "sidekiq-scheduler", require: false # Recurring/cron jobs
gem "view_component"                    # Re‑usable, testable view objects
gem "kaminari"                          # Pagination helper

########################################
# Quality‑of‑life & deployment
########################################
gem "dotenv-rails", groups: %i[development test]  # ENV management
gem "bootsnap", require: false                    # Faster boot
gem "kamal",      require: false                  # Containerized deploys
gem "thruster",   require: false                  # HTTP/asset acceleration

########################################
# Optional Active Storage (uncomment if needed)
# gem "image_processing", "~> 1.12"
########################################

########################################
# Development & Test toolchain
########################################
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman",          require: false   # Static security scan
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 8.0"               # Preferred test suite
  gem "factory_bot_rails"                   # Test data factories
  gem "faker"                               # Seed / fixture data
  gem "letter_opener", group: :development  # View mails in browser
end

group :development do
  gem "web-console"
  gem "annotate", require: false            # Auto‑annotate models & routes
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "database_cleaner-active_record"
end

# Windows Zeitwerk fix
gem "tzinfo-data", platforms: %i[windows jruby]
