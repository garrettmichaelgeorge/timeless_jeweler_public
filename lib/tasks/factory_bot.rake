# require 'stdlib/english'

# from https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#linting-factories
namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task lint: :environment do
    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint
        raise ActiveRecord::Rollback
      end
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV='test'")
      raise if $_.exitstatus.nonzero?
    end
  end
end
