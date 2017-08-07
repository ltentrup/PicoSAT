# Swift Bindings for PicoSAT

A swifty wrapper around the [PicoSAT](http://fmv.jku.at/picosat/) SAT solver by Armin Biere.

## Example Usage

```swift
import PicoSAT

let picosat = PicoSAT()
    
let a = picosat.new()
let b = picosat.new()
    
picosat.add(clause: [a, b])
picosat.add(clause: [-b])
picosat.solve() // -> .satisfiable
picosat.value(of: a) // -> .positive
picosat.value(of: b) // -> .negative
    
picosat.assume(literal: b)
picosat.solve() // -> .unsatisfiable
picosat.failed(literal: a) // -> false
picosat.failed(literal: b) // -> true
    
picosat.solve() // -> .satisfiable
```

# Installation

## Swift Package Manager

```swift
.Package(url: "https://github.com/ltentrup/PicoSAT.git", majorVersion: 0, minor: 1)
```

