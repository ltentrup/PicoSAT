import PackageDescription

let package = Package(
    name: "PicoSAT",
    targets: [
        Target(name: "PicoSAT", dependencies: ["CPicoSAT"]),
        Target(name: "CPicoSAT")
    ],
    dependencies: [
        .Package(url: "https://github.com/ltentrup/SATSolver.git", majorVersion: 0, minor: 1)
    ]
)
