# SPCoding

# ruby version
ruby 2.7.3p183

# using the applicaiton
do 'ruby parser.rb webserver.log' or you can have your own log file. make sure to be in the app directory and place your log file into the same directory.

# log file format
/help_page/1 126.318.035.038\n
/contact 184.123.665.067\n
/home 184.123.665.067\n

# output
➜  ruby parser.rb webserver.log
\n
views:\n
/help_page/1 80 views\n
/contact 89 views\n
/home 78 views\n
/about/2 90 views\n
/index 82 views\n
/about 81 views\n
\n
unique views:\n
/help_page/1 3 unique views\n
/contact 2 unique views\n
/home 2 unique views\n
/about/2 4 unique views\n
/index 4 unique views\n
/about 3 unique views\n
