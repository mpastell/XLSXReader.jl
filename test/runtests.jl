using XLSXReader, RDatasets
using Base.Test

#Test reference datasets and options
@test readxlsx("datasets/mtcars.xlsx") == dataset("datasets", "mtcars")
@test readxlsx("datasets/mtcars.xlsx") == readxlsx("datasets/mtcars.xlsx", 1)
@test readxlsx("datasets/mtcars.xlsx") == readxlsx("datasets/mtcars.xlsx", "Sheet1")

tdf = DataFrame(x1 = DataArray(Any[2, NA ,3.2, NA]),
                   x2 = DataArray(Any[NA, 3.2 ,NA, NA]),
                   x3 = DataArray(Any[NA, 7.5 ,NA, 4]))

#Test missing values
rdf = readxlsx("datasets/testsets.xlsx", header = false)
@test dropna(rdf[:x1]) == dropna(tdf[:x1])
@test dropna(rdf[:x2]) == dropna(tdf[:x2])
@test dropna(rdf[:x3]) == dropna(tdf[:x3])

#Test dates
ddf = readxlsx("datasets/testsets.xlsx", "dates")
@test names(ddf) == Symbol[:Dates, :Datetimes]
@test ddf[:Dates] == DateTime("2017-01-01T00:00:00") + Dates.Day.(0:8)
@test ddf[:Datetimes] == DateTime("2017-03-01T10:20:15") + Dates.Day.(0:8)

#Test shared string with format
sdf = readxlsx("datasets/testsets.xlsx", "sharedstrings")
@test names(sdf) == [:x1col, :x2col, :x3col]
@test Array(sdf[1,:])[1,:] == ["string", "style", "text"]
