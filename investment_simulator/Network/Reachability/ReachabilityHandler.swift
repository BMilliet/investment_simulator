import SystemConfiguration

struct ReachabilityHandler {
  private let reachability = SCNetworkReachabilityCreateWithName(nil, "https://www.google.com")

  func isDeviceConnected() -> Bool {
    var flags = SCNetworkReachabilityFlags()
    SCNetworkReachabilityGetFlags(self.reachability!, &flags)
    return isNetWorkReach(with: flags)
  }

  private func isNetWorkReach(with flags: SCNetworkReachabilityFlags) -> Bool {
    let isReachable = flags.contains(.reachable)
    let needConnection = flags.contains(.connectionRequired)
    let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
    let canConnectWithUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
    return isReachable && (!needConnection || canConnectWithUserInteraction)
  }
}
