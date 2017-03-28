using XLSXReader, RDatasets
using Base.Test


@test read_xlsx("datasets/mtcars.xlsx") == dataset("datasets", "mtcars")
@test read_xlsx("datasets/mtcars.xlsx") == read_xlsx("datasets/mtcars.xlsx", 1)
@test read_xlsx("datasets/mtcars.xlsx") == read_xlsx("datasets/mtcars.xlsx", "Sheet1")
