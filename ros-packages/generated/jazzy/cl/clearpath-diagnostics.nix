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
  version = "2.6.1-1";
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
        rev = "b862f941d50aa2acab34cf800781203eea461c0a";
        hash = "sha256-qDcxxeuD2jkqyfi32sBRlRUQhWum+8ESoT4S7h910dM=";
      };
    };
  });
  meta = {
    description = "Clearpath Robot Diagnostics Monitor";
  };
})
