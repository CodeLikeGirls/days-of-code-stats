# just checke that tasks run at least
bundle exec rake progress
bundle exec rake tags:initial_popular COUNT=100
bundle exec rake tags:popular COUNT=100
