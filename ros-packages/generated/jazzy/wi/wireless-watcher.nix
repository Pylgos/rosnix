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
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."wireless_watcher";
  propagatedBuildInputs = [ diagnostic-updater rclcpp wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "wireless-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "wireless_watcher" = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "b7540eba14a941eb28b7f4066b546e0d4463e836";
        hash = "sha256-bBxEjn4eNZv6KSb4QnioGhZeOFAS1P4A1jFpRpUjsgw=";
      };
    };
  });
  meta = {
    description = "A node which publishes connection information about a linux wireless interface.";
  };
})
