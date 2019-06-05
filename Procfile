publishing-api-worker: bundle exec sidekiq -C ./config/sidekiq/publishing_api.yml --tag content-audit-tool/publishing-api-worker
google-analytics-worker: bundle exec sidekiq -C ./config/sidekiq/google_analytics.yml --tag content-audit-tool/google-analytics-worker
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
