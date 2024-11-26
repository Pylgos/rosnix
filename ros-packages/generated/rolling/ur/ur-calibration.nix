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
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  ur-client-library,
  ur-robot-driver,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_calibration";
  version = "2.4.13-1";
  src = finalAttrs.passthru.sources."ur_calibration";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rclcpp ur-client-library ur-robot-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ur_calibration" = substituteSource {
        src = fetchgit {
          name = "ur_calibration-source";
          url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
          rev = "05bbc4fa4765982c5b11a6492ac950300fb4c73a";
          hash = "sha256-bfNHqRhygNfVl4zW8DGE69wqNuegJbmtLN9p2bc1tcI=";
        };
      };
    });
  };
  meta = {
    description = "Package for extracting the factory calibration from a UR robot and change it such that it can be used by ur_description to gain a correct URDF";
  };
})
