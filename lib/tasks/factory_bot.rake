# from https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#linting-factories
namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task lint: :environment do
    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint traits: true
        raise ActiveRecord::Rollback
      end
    else
      system("bin/rake factory_bot:lint RAILS_ENV='test'")
      raise if $_.exitstatus.nonzero?
    end
  end

  task lint_verbose: :environment do
    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint verbose: true, traits: true
        raise ActiveRecord::Rollback
      end
    else
      system("bin/rake factory_bot:lint_verbose RAILS_ENV='test'")
      raise if $_.exitstatus.nonzero?
    end
  end
end
