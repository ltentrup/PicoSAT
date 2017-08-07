import XCTest
@testable import CPicoSATTests
@testable import PicoSATTests


XCTMain([
     testCase(CPicoSATTests.allTests),
     testCase(PicoSATTests.allTests),
])
