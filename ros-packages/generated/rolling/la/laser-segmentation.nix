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
        rev = "548150d5a4f1b7342f2375df6ed2914ac0cd5d73";
        hash = "sha256-u0BxTOObbPkIga7fFw2mrJJOcy7+rd0rL7mPlCNOAlk=";
      };
    };
  });
  meta = {
    description = "Implementation of algorithms for segmentation of laserscans.";
  };
})
