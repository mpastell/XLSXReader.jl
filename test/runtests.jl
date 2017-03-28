using XLSXReader, RDatasets
using Base.Test

@test read_xlsx("datasets/mtcars.xlsx") == dataset("datasets", "mtcars")
