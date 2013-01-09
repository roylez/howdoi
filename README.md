howdoi - a code search tool
===========================

This is a ruby clone of original Python [howdoi][1] by gleitz.

Are you a hack programmer? Do you find yourself constantly Googling for
how to do basic programing tasks?

Suppose you want to know how to format a date in bash. Why open your
browser and read through blogs when you can just...

    $ howdoi format string bash
    > http://stackoverflow.com/questions/9832393/how-to-bash-script-format-unix-time-to-string
    > 
    > [foo@bar ~]$date --date "2012-02-13" +%s
    > 1329055200
    > [foo@bar ~]$date --date @1329055200
    > Mon Feb 13 00:00:00 EST 2012
    > [foo@bar ~]$date --date @1329055200 +"%Y-%m-%d"
    > 2012-02-13

howdoi will answer all sorts of queries

    $ howdoi print stack trace python
    > http://stackoverflow.com/questions/7901238/javas-printstacktrace-equivalent-in-python
    >
    > import traceback
    >
    > try:
    >     1/0
    > except:
    >     print '>>> traceback <<<'
    >     traceback.print_exc()
    >     print '>>> end of traceback <<<'
    > traceback.print_exc()

Installation
------------

    gem install howdoi

Usage
-----

::

    Usage: bin/howdoi [options] QUERY ...

        -p, --pos N                      select answer in specified position (default: 1)
        -a, --all                        display the full text of the answer

Author
------

-  Roy Zuo ([@roylez][2])

Notes
-----

-  Requires Nokogiri
-  Special thanks to Rich Jones ([@miserlou][3]) for the idea, and Benjamin Gleitzman ([@gleitz][4]) for original Python implementation

[1]: https://github.com/gleitz/howdoi/tree/master/howdoi
[2]: http://roylez.heroku.com
[3]: https://github.com/miserlou
[4]: https://github.com/gleitz
