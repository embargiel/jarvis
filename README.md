# Jarvis

Jarvis helps you find out problems with your code and offers to fix them for you.
It currently does a couple of simple checks and fixes, but I'd like it to do everything, from dead code elimination and suboptimal code fixing to enforcing html/css code styling or looking for n+1 queries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jarvis', git: 'git@github.com:KillaPL/jarvis.git'
```

And then execute:

    $ bundle

## Usage

    jarvis checkers

lists all available checkers

    jarvis find NAME

looks through all valid files and looks for problems according to passed checker

    jarvis seek_and_destroy NAME

looks through all valid files and fixes them according to passed checker NAME.

removes the file

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jarvis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
