{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_stop_filter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_stop_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_stop_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_stop_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "5f31d224c549b0312472a655c4486623af76443f";
        hash = "sha256-Af2e8m0xCxMcPKB1HFjrWSkb14yFmeDO8Aeke5e66EE=";
      };
    };
  });
  meta = {
    description = "The stop filter package";
  };
})
