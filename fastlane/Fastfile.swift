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

    func tests() {
        desc("Run iOS Unit tests")
        setup()
        runTests(scheme: "STMDemoAppTests", outputDirectory: "fastlane/test_output")
    }

    func ui_tests() {
        desc("Run iOS UItests")
        setup()
        runTests(scheme: "STMDemoAppUITests", outputDirectory: "fastlane/test_output")
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
