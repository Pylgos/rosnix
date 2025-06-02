{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-platform-msgs,
  diagnostic-aggregator,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_diagnostics";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."clearpath_diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clearpath-platform-msgs diagnostic-aggregator diagnostic-updater rclcpp ros2launch sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-platform-msgs diagnostic-aggregator diagnostic-updater rclcpp ros2launch sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_diagnostics" = substituteSource {
      src = fetchgit {
        name = "clearpath_diagnostics-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "7b68789beebdb9af2b9de13ccdcfe1da7223d194";
        hash = "sha256-nnFa6Uenv9sE3wPaNsWSVox7/XkFop992+m1K4CECPw=";
      };
    };
  });
  meta = {
    description = "Clearpath Robot Diagnostics Monitor";
  };
})
