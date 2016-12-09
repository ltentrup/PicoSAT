import CPicoSAT
import SATSolver

public class PicoSAT: SATSolver {
    public typealias Literal = Int32
    
    let picosat: OpaquePointer
    
    public init() {
        picosat = picosat_init()
    }
    
    deinit {
        picosat_reset(picosat)
    }
    
    public func new() -> Literal {
        return picosat_inc_max_var(picosat)
    }

    public func add(literal: Literal) {
        picosat_add(picosat, Int32(literal))
    }
    
    public func assume(literal: Literal) {
        picosat_assume(picosat, literal)
    }
    
    public func solve() -> SATSolverResult {
        let result = picosat_sat(picosat, -1)
        assert(result != PICOSAT_UNKNOWN)
        if result == PICOSAT_SATISFIABLE {
            return .satisfiable
        } else {
            assert(result == PICOSAT_UNSATISFIABLE)
            return .unsatisfiable
        }
    }
    
    public func value(of literal: Literal) -> SATSolverLiteralValue {
        let value = picosat_deref(picosat, literal)
        if value < 0 {
            return .negative
        } else if value > 0 {
            return .positive
        } else {
            return .unassigned
        }
    }
    
    public func failed(literal: Literal) -> Bool {
        return picosat_failed_assumption(picosat, literal) > 0
    }

}
