{
  buildAmentCmakePackage,
  diagnostic-updater,
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
  version = "1.1.4-1";
  src = finalAttrs.passthru.sources."wireless_watcher";
  propagatedBuildInputs = [ diagnostic-updater rclcpp wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "wireless-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "wireless_watcher" = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "7e998f04cdbfe2e6034af508a8df85e00d5b7e82";
        hash = "sha256-k3oVG7NKXQCvUUwsbBvkD3j19onzXH2wu+IUbpF1ZJ0=";
      };
    };
  });
  meta = {
    description = "A node which publishes connection information about a linux wireless interface.";
  };
})
