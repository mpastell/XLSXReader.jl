using XLSXReader, RDatasets
using Test, Dates

#Test reference datasets and options
@test readxlsx("datasets/mtcars.xlsx") == dataset("datasets", "mtcars")
@test readxlsx("datasets/mtcars.xlsx") == readxlsx("datasets/mtcars.xlsx", 1)
@test readxlsx("datasets/mtcars.xlsx") == readxlsx("datasets/mtcars.xlsx", "Sheet1")

tdf = DataFrame(x1 = Array(Any[2, missing ,3.2, missing]),
                   x2 = Array(Any[missing, 3.2 ,missing, missing]),
                   x3 = Array(Any[missing, 7.5 ,missing, 4]))

#Test missing values
rdf = readxlsx("datasets/testsets.xlsx", header = false)
@test all(skipmissing(rdf[:x1]) .== skipmissing(tdf[:x1]))
@test all(skipmissing(rdf[:x2]) .== skipmissing(tdf[:x2]))
@test all(skipmissing(rdf[:x3]) .== skipmissing(tdf[:x3]))

#Test dates
ddf = readxlsx("datasets/testsets.xlsx", "dates")
@test names(ddf) == Symbol[:Dates, :Datetimes]
@test ddf[:Dates] == DateTime("2017-01-01T00:00:00") + Dates.Day.(0:8)
@test ddf[:Datetimes] == DateTime("2017-03-01T10:20:15") + Dates.Day.(0:8)

#Test shared string with format
sdf = readxlsx("datasets/testsets.xlsx", "sharedstrings")
@test sdf == readxlsx("datasets/testsets.xlsx", 4)
@test names(sdf) == [:x1col, :x2col, :x3col]
@test Vector(sdf[1,:]) == ["string", "style", "text"]

#Test booleans, empty cols and NA header
bdf = readxlsx("datasets/testsets.xlsx", "booleans")
@test names(bdf) == Symbol[:boolcol, :x1, :moredata]
@test bdf[:boolcol] == [true, false, true, false, false]
