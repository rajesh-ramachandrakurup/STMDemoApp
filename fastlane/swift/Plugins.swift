import Foundation
/**
 Upload all dsyms (possibly in a zip file) to new relic

 - parameters:
   - newRelicAppName: The name of your app
   - newRelicLicenseKey: Your New Relic app license key
   - dsymPath: Path to the DSYM file or zip to upload
   - newRelicUploadLibs: The library names to upload

 Upload all dsyms (possibly in a zip file) to new relic
*/
func uploadSymbolsToNewRelic(newRelicAppName: String,
                             newRelicLicenseKey: String,
                             dsymPath: String? = nil,
                             newRelicUploadLibs: String? = nil) {
  let command = RubyCommand(commandID: "", methodName: "upload_symbols_to_new_relic", className: nil, args: [RubyCommand.Argument(name: "new_relic_app_name", value: newRelicAppName),
                                                                                                             RubyCommand.Argument(name: "new_relic_license_key", value: newRelicLicenseKey),
                                                                                                             RubyCommand.Argument(name: "dsym_path", value: dsymPath),
                                                                                                             RubyCommand.Argument(name: "new_relic_upload_libs", value: newRelicUploadLibs)])
  _ = runner.executeCommand(command)
}
