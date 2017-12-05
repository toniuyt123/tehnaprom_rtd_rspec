require "csv"

class SumsController < ApplicationController
	Col = 0
	def calc
		arr = CSV.parse(params["file"].read, converters: :numeric)
		sum = 0;
		arr.each do |n|
			sum += n[Col];
		end
		render plain: "%.2f" % (sum).ceil
	end
end

