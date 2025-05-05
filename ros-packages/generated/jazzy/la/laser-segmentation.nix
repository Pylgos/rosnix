{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  slg-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "laser_segmentation";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."laser_segmentation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ rclcpp-components sensor-msgs slg-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_segmentation" = substituteSource {
      src = fetchgit {
        name = "laser_segmentation-source";
        url = "https://github.com/ros2-gbp/laser_segmentation-release.git";
        rev = "f1943d1defec9a66043ef4651b99c0859ec00576";
        hash = "sha256-x3i3fAvPvesehThzXkMdt5ffUGxiD4gQ4FfQqSVDBIM=";
      };
    };
  });
  meta = {
    description = "Implementation of algorithms for segmentation of laserscans.";
  };
})
