{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
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
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz2";
  version = "14.1.11-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-pytest ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz2" = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "d11655522c232faf248d6b8336660b7d17b78e80";
        hash = "sha256-GSkLn0PAHtf1Y0S1ddZGcC3F1ouQv368wH0A/azjCdI=";
      };
    };
  });
  meta = {
    description = "\n    3D visualization tool for ROS.\n  ";
  };
})
