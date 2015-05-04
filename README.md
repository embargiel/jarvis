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

    jarvis init

indexes files in your system. This list is then used for problems scanning.

    jarvis scan

goes through all problem checkers and files, and saves an information about each problem it finds.

    jarvis status

returns count of all found problems and tells you how you can ask him to fix it

    jarvis checkers

lists all available checkers

    jarvis fixall NAME

fixes all found instances of found problems. Currently supported are:

    jarvis fixall empty_file

removes the file

    jarvis fixall missing_newline_at_end

appends newline at the end of file

    jarvis fixall trailing whitespace

removes the trailing whitespace

    jarvis fixall empty_helper_file

removes the file

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jarvis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
