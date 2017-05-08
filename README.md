Stats parser for it-learning challenge

TODO:  
- refactor #for_users - make (nil-)signs more usable
- add number to stats (maybe)
- make it possible to view all tags

run with sample file:
```bash
# 15 most popular tags planned to learn
bundle exec rake tags:initial_popular
# 100 most popular tags planned to learn
bundle exec rake tags:initial_popular COUNT=100
# 15 most popular tags learned
bundle exec rake tags:popular
# individual progress on tags for each user
bundle exec rake tags:for_users
# users' progress
bundle exec rake progress
# use other file with another FILE (default is input.csv):
bundle exec rake progress FILE=input-all.csv
```

So-called test:
```bash
test/tasks_test.sh
```
