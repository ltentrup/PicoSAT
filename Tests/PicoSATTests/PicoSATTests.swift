import XCTest
@testable import PicoSAT

class PicoSATTests: XCTestCase {
    func testIncrementalSolving() {
        let picosat = PicoSAT()
        
        let a = picosat.new()
        let b = picosat.new()
        XCTAssertNotEqual(a, b)
        
        picosat.add(clause: [a, -b])
        XCTAssertEqual(picosat.solve(), .satisfiable)
        XCTAssertEqual(picosat.value(of: a), .positive)
        XCTAssertEqual(picosat.value(of: b), .negative)
        
        picosat.add(clause: [-a])
        picosat.assume(literal: b)
        XCTAssertEqual(picosat.solve(), .unsatisfiable)
        XCTAssertFalse(picosat.failed(literal: a))
        XCTAssertTrue(picosat.failed(literal: b))
        
        XCTAssertEqual(picosat.solve(), .satisfiable)
    }


    static var allTests : [(String, (PicoSATTests) -> () throws -> Void)] {
        return [
            ("testIncrementalSolving", testIncrementalSolving),
        ]
    }
}
