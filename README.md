# XLSXReader

[![Build Status](https://travis-ci.org/mpastell/XLSXReader.jl.svg?branch=master)](https://travis-ci.org/mpastell/XLSXReader.jl)
[![Coverage Status](https://coveralls.io/repos/mpastell/XLSXReader.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/mpastell/XLSXReader.jl?branch=master)
[![codecov.io](http://codecov.io/github/mpastell/XLSXReader.jl/coverage.svg?branch=master)](http://codecov.io/github/mpastell/XLSXReader.jl?branch=master)

This package reads Excel xlsx files to a Julia DataFrame. Contents are parsed from XML using `LightXML.jl`. The package works, but currently supports limited cell types.

Currently reads:
* Floats and Integers
* Strings
* Basic date formats

## Usage

```julia
usign XLSXReader
read_xlsx("file.xslx") # Reads first sheet
read_xlsx("file.xslx", 2) # Read by sheet number
read_xlsx("file.xslx", "sheet4") # Read by sheet name
```
