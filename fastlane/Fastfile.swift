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
        runTests(scheme: "STMDemoApp", outputDirectory: "fastlane/test_output")
    }

    func ui_testsLane() {
        desc("Run iOS UItests")
        setup()
        runTests(scheme: "STMDemoApp", outputDirectory: "fastlane/test_output")
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
