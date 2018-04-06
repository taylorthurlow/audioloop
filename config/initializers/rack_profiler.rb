if Rails.env.development?
  require "rack-mini-profiler"

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)

  Rack::MiniProfiler.config.position = 'bottom-left'
  Rack::MiniProfiler.config.start_hidden = true # use alt-P to unhide
end
