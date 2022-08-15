require 'spec_helper'
require 'helper'

RSpec.describe Parser::Helper do
	context 'filter_args' do
		it 'should filter file arg' do
			helper = described_class::filter_args(['test.log'])
			expect(helper).to eq({file:'test.log'})
		end
	end
end