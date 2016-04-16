grades = Hash.new
s = "shivam"
grades["shivam"] = 9
grades["samyak"] = 8
grades["vikas"] = 7
sorted = grades.sort_by{ |name, marks| marks }.reverse
sorted.each do |sort|
	puts sort[0], "hello", sort[1]
end
