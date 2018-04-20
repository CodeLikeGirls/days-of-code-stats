Good enough stats parser for the it self-learning challenge:

Configuration: edit `config.yml`

Generate texts for the days' posts:
```bash
ruby days.rb
```

Run with the sample file (input.csv):
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

Run tests:
```bash
test/tasks_test.sh # to run this test first create input.csv (e.g. from input.sample.csv)
ruby parser_test.rb
```
