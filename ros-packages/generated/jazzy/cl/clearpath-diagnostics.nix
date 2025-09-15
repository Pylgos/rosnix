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
  foxglove-bridge,
  mkSourceSet,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_diagnostics";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."clearpath_diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clearpath-platform-msgs diagnostic-aggregator diagnostic-updater foxglove-bridge rclcpp ros2launch sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-platform-msgs diagnostic-aggregator diagnostic-updater foxglove-bridge rclcpp ros2launch sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_diagnostics" = substituteSource {
      src = fetchgit {
        name = "clearpath_diagnostics-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "b6a0c6408f73bb21868661a275f7dc96c3c529d1";
        hash = "sha256-DK1jjc3PutQVwpBbuRLOekV0Ln4kN6ZZlgS1BYTHM1w=";
      };
    };
  });
  meta = {
    description = "Clearpath Robot Diagnostics Monitor";
  };
})
