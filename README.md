Stats parser for it-learning challenge

TODO:
- make it possible to view all tags
- stats for all days tags
- beautiful headers
- take file path as argument

run with sample file:
```bash
# 15 most popular tags planned to learn
bundle exec rake tags:initial_popular
# 200 most popular tags planned to learn
bundle exec rake tags:initial_popular COUNT=100
# users' progress
bundle exec rake progress
```