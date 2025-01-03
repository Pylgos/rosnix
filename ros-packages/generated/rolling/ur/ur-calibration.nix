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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ur_calibration";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rclcpp ur-client-library ur-robot-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur_calibration" = substituteSource {
      src = fetchgit {
        name = "ur_calibration-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "761107d4ebc86c5521845febe1a3360814780d7c";
        hash = "sha256-2suxE8rZw0vwMUGT17/k4602EXBlaN1ExgIE9DiSMBI=";
      };
    };
  });
  meta = {
    description = "Package for extracting the factory calibration from a UR robot and change it such that it can be used by ur_description to gain a correct URDF";
  };
})
