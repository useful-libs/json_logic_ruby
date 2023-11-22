# JsonLogic

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. 
Put your Ruby code in the file `lib/json_logic`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add json_logic

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install json_logic

## Usage
```ruby
CRITERIA = <<~JSON
  { "and" : [
      {">=" : [ { "var" : "age" }, 50 ]},
      {">=" : [ { "var" : "bmi" }, 50 ]}
    ] }
JSON

DATA = Oj.load('{ "age" : 51, "bmi" : 49}')

logic = JsonLogic::Evaluator.new
res = logic.apply(Oj.load(CRITERIA), DATA)
puts "Criteria eligible: #{res}"

# extract all variables used in criteria
res = logic.extract_vars(Oj.load(CRITERIA))
puts "Variables used in criteria: #{res}"

# will print
# 
# Variables used in criteria: ["age", "bmi"]

# output report of all operations
puts logic.tracker.report

# will print
#
# Criteria eligible: false
# LOGIC: 'and', RESULT = false
#   DATA: 'age' data:51 >= expected:50,  RESULT = true
#   DATA: 'bmi' data:49 >= expected:50,  RESULT = false
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/json-logic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/json-logic/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Json::Logic project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/json-logic/blob/master/CODE_OF_CONDUCT.md).
