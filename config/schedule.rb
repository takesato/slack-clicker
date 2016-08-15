job_type :exec, 'cd :path && bundle exec exe/:task > :path/system.log 2>&1'

every 1.hours do
  exec 'notify'
end
