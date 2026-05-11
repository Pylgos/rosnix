{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_visual_testing_framework";
  version = "16.0.0-1";
  src = finalAttrs.passthru.sources."rviz_visual_testing_framework";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest geometry-msgs rclcpp rcutils rviz-common rviz-ogre-vendor rviz-rendering std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-gtest geometry-msgs rclcpp rcutils rviz-common rviz-ogre-vendor rviz-rendering std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt-base-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_visual_testing_framework" = substituteSource {
      src = fetchgit {
        name = "rviz_visual_testing_framework-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "1f217c75129c7458b1c68ec23b565d020e3017b6";
        hash = "sha256-J0d1Ih1ILRV+10mhAupNauBiyoIW7GJ5MmbrD5g24Ls=";
      };
    };
  });
  meta = {
    description = "\n    3D testing framework for RViz.\n  ";
  };
})
