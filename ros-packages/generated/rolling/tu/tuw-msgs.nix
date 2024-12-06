{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tuw-airskin-msgs,
  tuw-geometry-msgs,
  tuw-graph-msgs,
  tuw-multi-robot-msgs,
  tuw-nav-msgs,
  tuw-object-map-msgs,
  tuw-object-msgs,
  tuw-std-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_msgs";
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."tuw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "70130781e32b5295a760f6daceec460d1a3e95e0";
        hash = "sha256-Yz6d9BtZhDSErAGcSwWf0BV+lwLJexsbCyrfNr76dLo=";
      };
    };
  });
  meta = {
    description = "tuw_msgs meta package with write and read file libs for tuw_msgs";
  };
})
