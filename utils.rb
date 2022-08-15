module Parser
  class Utils

    attr_accessor :lines, :visits_on_website, :visitor_on_site

    def initialize(file)
      @lines = File.readlines file
      process_visits
    end

    def parse
      @lines.map { |m| m.strip.split(' ') }
    end

    def process_visits
      @visits_on_website = {}
      @visitor_on_site = {}
      @lines.map do |line|
        striped_line = line.strip.split(' ')
        line_site = striped_line.first
        ip = striped_line.last
        @visits_on_website[line_site] ||= {}
        @visits_on_website[line_site][:count] ||= 0
        @visits_on_website[line_site][:count] += 1
        @visits_on_website[line_site][:ips] ||= []
        @visits_on_website[line_site][:ips] << ip
        @visitor_on_site[ip] ||= {}
        @visitor_on_site[ip][:count] ||= 0
        @visitor_on_site[ip][:count] += 1
        @visitor_on_site[ip][:website] ||= []
        @visitor_on_site[ip][:website] << line_site 
        @visitor_on_site[ip][line_site] ||= 0
        @visitor_on_site[ip][line_site] += 1
      end
    end

    def total_views
      @visits_on_website
    end

    def unique_views
      uviews = {}
      @visits_on_website.keys.uniq.map do |m|
        @visitor_on_site.map do |_k, v|
          if v[m] == 1
            uviews[m] ||= {}
            uviews[m][:count] ||= 0
            uviews[m][:count] += 1
          end
        end
      end
      uviews
    end
  end
end
