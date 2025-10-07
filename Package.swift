// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PovioKitNetworking",
  platforms: [
    .iOS(.v16),
    .macOS(.v13)
  ],
  products: [
    .library(name: "PovioKitNetworking", targets: ["PovioKitNetworking"]),
    .library(name: "PovioKitPromise", targets: ["PovioKitPromise"])
  ],
  dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0"))
  ],
  targets: [
    .target(
      name: "PovioKitNetworking",
      dependencies: [
        "PovioKitPromise",
        .product(name: "Alamofire", package: "Alamofire"),
      ],
      path: "Sources/AlamofireNetworkClient",
      resources: [.copy("../../Resources/PrivacyInfo.xcprivacy")]
    ),
    .target(
      name: "PovioKitPromise",
      dependencies: [],
      path: "Sources/PromiseKit",
      resources: [.copy("../../Resources/PrivacyInfo.xcprivacy")]
    ),
    .testTarget(
      name: "PovioKitNetworkingTests",
      dependencies: ["PovioKitNetworking"]
    ),
  ]
)
