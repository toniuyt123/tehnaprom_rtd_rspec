require "csv"

class IntervalsController < ApplicationController
	Col = 0;
	def calc
		arr = CSV.parse(params["file"].read, converters: :numeric)
		len = arr.length - 30
		i = 0
		maxSum = 0
		while i <= len do
			count = 0
			sum = 0
			arr.each do |n|
				if count >= i
					sum += n[Col]
				end
				count += 1
				if count == 30 + i
					break
				end
			end
			if maxSum <= sum
				maxSum = sum
			end
			i += 1
		end 
		if len < 0
			arr.each do |n|
				maxSum += n[Col]
			end
		end
		render plain: "%.2f" % maxSum
	end
end
