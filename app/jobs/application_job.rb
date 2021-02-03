class ApplicationJob < ActiveJob::Base
  # Use CableReady from ActiveJob
  # https://cableready.stimulusreflex.com/cableready-everywhere#jobs
  include CableReady::Broadcaster
  delegate :render, to: :ApplicationController

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
