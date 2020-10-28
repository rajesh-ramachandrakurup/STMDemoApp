public class Matchfile: MatchfileProtocol {
    public var gitUrl = ""
    public var gitBranch = ""
    public var appIdentifier = [devIdentifier, prodIdentifier]
	var username = appleID
    var teamId = ""
    var teamName = ""
}

// For all available options run `fastlane match --help`
// Remove the // in the beginning of the line to enable the other options
