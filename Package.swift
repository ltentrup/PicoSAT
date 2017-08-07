import PackageDescription

let package = Package(
    name: "PicoSAT",
    targets: [
        Target(name: "PicoSAT", dependencies: ["CPicoSAT"]),
        Target(name: "CPicoSAT")
    ],
    dependencies: [
        .Package(url: "../SATSolver", majorVersion: 0, minor: 4)
    ]
)
