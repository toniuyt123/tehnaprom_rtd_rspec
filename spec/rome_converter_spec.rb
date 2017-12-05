require_relative '../lib/rome_converter.rb'

RSpec.describe RomeConverterSpec do

	context "convererts roman to decimal and decimal to roman" do

		conversion_table = {
			""          => 0,
			"I"         => 1,
			"IV"        => 4,
			"XIX"       => 19,
			"XCI"       => 91,
			"XCVI"      => 96,
			"CDLII"	  => 453,
			"MCMXVIII"  => 1918,
			"MMCDXCVI"  => 2496,
			"MMMDCCXCI"  =>3791,
			"MMMMCMXCVIII"   => 4998 #a bi trqbvalo da ne e taka zashtoto ima 4ri M-ta ama vsichki mn me hate-naha che e bilo taka i go smenih
		}

		it "converts roman to decimal" do
			number = RomeConverter.new
			conversion_table.each do |roman, decimal|
				expect(number.to_dec(roman)).to eq(decimal)
			end
		end

		it "converts decimal to roman" do
			number = RomeConverter.new
			conversion_table.each do |roman, decimal|
				expect(number.to_rome(decimal)).to eq(roman)
			end
		end
	end
end

