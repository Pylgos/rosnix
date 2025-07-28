{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_visual_testing_framework";
  version = "14.1.13-1";
  src = finalAttrs.passthru.sources."rviz_visual_testing_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest geometry-msgs rclcpp rcutils rviz-common rviz-ogre-vendor rviz-rendering std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-gtest geometry-msgs rclcpp rcutils rviz-common rviz-ogre-vendor rviz-rendering std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gmock ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_visual_testing_framework" = substituteSource {
      src = fetchgit {
        name = "rviz_visual_testing_framework-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "d54289cf94c38a6b12c3b77ee690bac467a0d15b";
        hash = "sha256-5q5Go9FvuQDjZXXVGe6Y0xHO1zMd8KDThzSrl+Jt/H0=";
      };
    };
  });
  meta = {
    description = "\n    3D testing framework for RViz.\n  ";
  };
})
