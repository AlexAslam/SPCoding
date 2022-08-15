# SPCoding

# ruby version
ruby 2.7.3p183

# using the applicaiton
do 'ruby parser.rb webserver.log' or you can have your own log file. make sure to be in the app directory and place your log file into the same directory.

# log file format
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067

# output
➜  ruby parser.rb webserver.log

views:
/help_page/1 80 views
/contact 89 views
/home 78 views
/about/2 90 views
/index 82 views
/about 81 views

unique views:
/help_page/1 3 unique views
/contact 2 unique views
/home 2 unique views
/about/2 4 unique views
/index 4 unique views
/about 3 unique views
