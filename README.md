# ThinReports Official Web Site

[![Build Status](https://travis-ci.org/thinreports/thinreports.org.svg?branch=master)](https://travis-ci.org/thinreports/thinreports.org) [![Dependency Status](https://gemnasium.com/thinreports/thinreports.org.svg)](https://gemnasium.com/thinreports/thinreports.org)

This is the source for the [thinreports.org](http://www.thinreports.org).
thinreports.org is generated by [nanoc](http://nanoc.ws).

## Contribution

### Report mistakes, post your suggestions

If you find mistakes or improvements of [www.thinreports.org](http://wwww.thinreports.org),
please report it [here](https://github.com/thinreports/thinreports.org/issues/new).

### Pull Request

Fork it, and clone it:

    $ git clone git@github.com:yourname/thinreports.org.git

Create your feature or improvment branch:

    $ git checkout -b new-feature

Install runtime dependencies:

    $ bundle install

Fix mistakes or improve, then compile:

    $ bundle exec nanoc compile

And start the web server:

    $ bundle exec nanoc view

Open http://localhost:3000 in your browser, and make sure your changes.  
Then commit:

    $ git commit -am 'add some new feature'

Push to the branch:

    $ git push origin new-feature

Create new Pull Request!
