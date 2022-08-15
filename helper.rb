module Parser
  module Helper
    def self.format_text(data, comment)
      print "\n#{comment}:\n"
      data.map do |k, v|
        puts "#{k} #{v[:count]} #{comment}"
      end
    end

    def self.filter_args(args)
      filter_hash = {}
      args.map do |m|
        if m.match(/.log/)
          filter_hash[:file] = m
        end
      end
      filter_hash
    end
  end
end