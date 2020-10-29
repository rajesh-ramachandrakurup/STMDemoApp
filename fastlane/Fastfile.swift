// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

public class Fastfile: LaneFile {

    // MARK: Config

    // MARK: Lanes

    func testsLane() {
        desc("Run iOS Unit tests")
        setup()
        runTests(
            workspace: "STMDemoApp.xcworkspace",
            scheme: "STMDemoAppTests",
            device: "iPhone 11 Pro",
            onlyTesting: "STMDemoAppTests",
            outputDirectory: "fastlane/test_output",
            skipBuild: true,
            deploymentTargetVersion: "14.0"
        )
    }

    func ui_testsLane() {
        desc("Run iOS UItests")
        setup()
        runTests(
            workspace: "STMDemoApp.xcworkspace",
            scheme: "STMDemoAppUITests",
            device: "iPhone 11 Pro",
            onlyTesting: "STMDemoAppUITests",
            outputDirectory: "fastlane/test_output",
            skipBuild: true,
            deploymentTargetVersion: "14.0"
        )
        
    }

    public func beforeAll(with lane: String) {
        setupCircleCi()
    }

    // MARK: Helpers

    /// Call before each build
    private func setup() {
        xcversion(version: "~> 12.0.1")
        clearDerivedData()
        cocoapods(tryRepoUpdateOnError: true)
    }

}
