import PackageDescription

let package = Package(
    name: "PicoSAT",
    dependencies: [
        .Package(url: "../CPicoSAT", majorVersion: 0, minor: 1),
        .Package(url: "../SATSolver", majorVersion: 0, minor: 4)
    ]
)
