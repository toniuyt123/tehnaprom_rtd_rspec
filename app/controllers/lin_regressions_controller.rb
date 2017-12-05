require "csv"
require "linear-regression"

class LinRegressionsController < ApplicationController
	Col = 0
	def calc
		arr = CSV.parse(params["file"].read, converters: :numeric)
		x = (1..arr.length).to_a
		y = arr.map {|n| n[Col]}
		lin = Regression::Linear.new(x, y)
		a = lin.slope
		b = lin.intercept
		render plain: "%.6f" % a + "," + "%.6f" % b
	end
end
