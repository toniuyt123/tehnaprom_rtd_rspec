require "csv"

class FiltersController < ApplicationController
	ColX = 1
	ColY = 2
	def calc
		sum = 0;
		arr = CSV.parse(params["file"].read, converters: :numeric)
		arr.each do |n|
			if n[ColY] % 2 == 0
				sum += n[ColX]	
			end
		end
		render plain: "%.2f" % (sum).ceil
	end
end
