{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wireless-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wireless_watcher";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."wireless_watcher";
  propagatedBuildInputs = [ rclcpp wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "wireless-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "wireless_watcher" = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "bc5fcc8b0ecfa0ac96e68439ebaf3a79b3309f04";
        hash = "sha256-LVzZKaja+eL9q3jbwqMngFNgzdH2z73xaVhOWfaUKps=";
      };
    };
  });
  meta = {
    description = "A node which publishes connection information about a linux wireless interface.";
  };
})
