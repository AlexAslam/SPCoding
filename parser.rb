$LOAD_PATH.unshift('.', __dir__)

module Parser
  autoload :Utils, 'utils'
  autoload :Helper, 'helper'
end

Hash.class_eval do
  def format_hash(comment)
    Parser::Helper::format_text(self,comment)
  end
end

args = Parser::Helper::filter_args(ARGV)

if args[:file]
  parser = Parser::Utils.new(args[:file])
  parser.total_views.format_hash("views")
  parser.unique_views.format_hash("unique views")
else
  print "Please provide log file by running 'ruby parser.rb your_log_file.log'\n"
end