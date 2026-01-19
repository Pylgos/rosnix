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
  version = "2.8.4-1";
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
        rev = "710be610d6df82ca5b818603010c8acbc3eb8ba8";
        hash = "sha256-+iiVEG7B15jC1w6KMY7WMSd0kXnUiJIU4K7Xb+qsvJY=";
      };
    };
  });
  meta = {
    description = "Clearpath Robot Diagnostics Monitor";
  };
})
