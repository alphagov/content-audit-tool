namespace :heroku do
  desc 'Configure the environment to do Heroku deployments'
  task :prepare do |_task|
    Kernel.system 'git remote add heroku https://git.heroku.com/content-performance-manager.git'
  end

  desc 'Deploys the application to Heroku'
  task :deploy do |_task|
    Kernel.system 'git push heroku master'
  end
end
