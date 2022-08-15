require 'spec_helper'
require 'utils'

RSpec.describe Parser::Utils do

  let(:visitor_on_site) {
    {
        "126.318.035.038" => {
          :count => 1, 
          :website => ["/help_page/1"], 
          "/help_page/1" => 1
        }, 
        "184.123.665.067" => {
          :count => 3, 
          :website => ["/contact",  "/home", "/contact"], 
          "/contact" => 2, 
          "/home" => 1
        }, 
        "444.701.448.104" => {
          :count => 3, 
          :website => ["/about/2", "/index", "/about/2"], 
          "/about/2" => 2, 
          "/index" => 1
        }, 
        "929.398.951.889" => {
          :count => 1, 
          :website => ["/help_page/1"], 
          "/help_page/1"=>1
        }, 
        "061.945.150.735" => {
          :count => 1, 
          :website => ["/about"], 
          "/about" => 1
        }, 
        "235.313.352.950" => { 
          :count => 1, 
          :website => ["/home"], 
          "/home" => 1
        }, 
        "316.433.849.805" => {
          :count => 1, 
          :website => ["/home"], "/home" => 1
        }, 
        "543.910.244.929" => {
          :count => 1, 
          :website => ["/contact"], 
          "/contact" => 1
        }
      }
  }

  let(:visits_on_website) {
    {
        "/help_page/1" => {
          :count => 2, 
          :ips => ["126.318.035.038", "929.398.951.889"]
        }, 
        "/contact" => {
          :count => 3, 
          :ips => ["184.123.665.067", "184.123.665.067", "543.910.244.929"]
        }, 
        "/home" => {
          :count => 3, 
          :ips => ["184.123.665.067", "235.313.352.950", "316.433.849.805"]
        }, 
        "/about/2" => {
          :count => 2, 
          :ips => ["444.701.448.104", "444.701.448.104"]
        }, 
        "/index" => {
          :count => 1, 
          :ips => ["444.701.448.104"]
        }, 
        "/about" => {
          :count => 1, 
          :ips => ["061.945.150.735"]
        }
      }
  }

  context "initialize" do

    it 'should parse a log file' do
      expect(described_class).to receive(:new).with("spec/extras/test.log")
      described_class.new("spec/extras/test.log")
    end
    
    it 'should return visitor_on_site' do
      parser = described_class.new("spec/extras/test.log")
      expect(parser.visitor_on_site).to eq(visitor_on_site)
    end

    it 'should return visits_on_website' do
      parser = described_class.new("spec/extras/test.log")
      expect(parser.visits_on_website).to eq(visits_on_website)
    end
  end

  context 'parse' do
    it 'should convert string to array separated by space' do
      parser = described_class.new('spec/extras/test.log')
      expect(parser.parse).to eq([["/help_page/1", "126.318.035.038"], ["/contact", "184.123.665.067"], ["/home", "184.123.665.067"], ["/about/2", "444.701.448.104"], ["/help_page/1", "929.398.951.889"], ["/index", "444.701.448.104"], ["/about", "061.945.150.735"], ["/home", "235.313.352.950"], ["/contact", "184.123.665.067"], ["/home", "316.433.849.805"], ["/about/2", "444.701.448.104"], ["/contact", "543.910.244.929"]])
    end
  end

  context 'process_visits' do
    it 'should convert parsed file data to visitor_on_site hash' do
      parser = described_class.new('spec/extras/test.log')
      parser.process_visits
      expect(parser.visitor_on_site).to eq(visitor_on_site)
    end
    it 'should convert parsed file data to visits_on_website hash' do
      parser = described_class.new('spec/extras/test.log')
      parser.process_visits
      expect(parser.visits_on_website).to eq(visits_on_website)
    end
  end

  context 'total_views' do
    it 'should return the visits_on_website' do
      parser = described_class.new('spec/extras/test.log')
      expect(parser.visits_on_website).to eq(visits_on_website)
    end
  end

  context 'unique_views' do
    
    let(:unique_views) {
      {
        "/help_page/1" => {
          :count => 2
        }, 
        "/contact" => {
          :count => 1
        }, 
        "/home" => {
          :count => 3
        }, 
        "/index" => {
          :count => 1
        }, 
        "/about" => {
          :count => 1
        }
      }
    }

    it 'should return the unique views of visitors' do
      parser = described_class.new('spec/extras/test.log')
      expect(parser.unique_views).to eq(unique_views)
    end
  end
end