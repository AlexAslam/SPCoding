# SPCoding

# ruby version
ruby 2.7.3p183

# using the applicaiton
do 'ruby parser.rb webserver.log' or you can have your own log file. make sure to be in the app directory and place your log file into the same directory.

# log file format
/help_page/1 126.318.035.038 <br />
/contact 184.123.665.067 <br />
/home 184.123.665.067 <br />

# output
➜  ruby parser.rb webserver.log
views: <br />
/help_page/1 80 views <br />
/contact 89 views <br />
/home 78 views <br />
/about/2 90 views <br />
/index 82 views <br />
/about 81 views <br />
<br />
unique views: <br />
/help_page/1 3 unique views <br />
/contact 2 unique views <br />
/home 2 unique views <br />
/about/2 4 unique views <br />
/index 4 unique views <br />
/about 3 unique views <br />
