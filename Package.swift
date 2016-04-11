import PackageDescription

let package = Package(
  name:  "ReactGtk",
  dependencies: [
    .Package(url: "https://github.com/ptmt/SwiftGtk", majorVersion: 0, minor: 2),
    .Package(url: "https://github.com/ptmt/cjsc.git", majorVersion: 0, minor: 1)
  ]
)
