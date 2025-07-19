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
  version = "3.0.2-2";
  src = finalAttrs.passthru.sources."laser_segmentation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs slg-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs slg-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_segmentation" = substituteSource {
      src = fetchgit {
        name = "laser_segmentation-source";
        url = "https://github.com/ros2-gbp/laser_segmentation-release.git";
        rev = "aa0f6b07ac8ddd276606d42e84877fe2801c0e2b";
        hash = "sha256-u0BxTOObbPkIga7fFw2mrJJOcy7+rd0rL7mPlCNOAlk=";
      };
    };
  });
  meta = {
    description = "Implementation of algorithms for segmentation of laserscans.";
  };
})
