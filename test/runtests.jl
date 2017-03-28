using XLSXReader, RDatasets
using Base.Test


@test read_xlsx("datasets/mtcars.xlsx") == dataset("datasets", "mtcars")
@test read_xlsx("datasets/mtcars.xlsx") == read_xlsx("datasets/mtcars.xlsx", 1)
@test read_xlsx("datasets/mtcars.xlsx") == read_xlsx("datasets/mtcars.xlsx", "Sheet1")

tdf = DataFrame(x1 = DataArray(Any[2, NA ,3.2, NA]),
                   x2 = DataArray(Any[NA, 3.2 ,NA, NA]),
                   x3 = DataArray(Any[NA, 7.5 ,NA, 4]))
rdf = read_xlsx("datasets/sparse.xlsx", header = false)

@test dropna(rdf[:x1]) == dropna(tdf[:x1])
@test dropna(rdf[:x2]) == dropna(tdf[:x2])
@test dropna(rdf[:x3]) == dropna(tdf[:x3])
