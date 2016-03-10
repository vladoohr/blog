Blog App

INSTALL:

  Clone repository

    git clone git://github.com/vladoohr/blog.git
    cd blog

  Install gems

    bundle install

  Setup database

    rake db:migrate

  Set cron job for worker
    whenever --update-cron theNameOfCronJob

