{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-mypy,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  leo-description,
  leo-gz-plugins,
  leo-gz-worlds,
  mkSourceSet,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_bringup";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."leo_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros leo-description leo-gz-plugins leo-gz-worlds robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros leo-description leo-gz-plugins leo-gz-worlds robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim xacro ];
  checkInputs = [ ament-cmake-black ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-mypy ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_gz_bringup-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "5202f0d22873ed24336e8d6bae90f39fa1559a6c";
        hash = "sha256-ZqM0yWN/+oHI54zDMaOgVLJh8QulO6GVGqufAmBjxx8=";
      };
    };
  });
  meta = {
    description = "Bringup package for Leo Rover Gazebo simulation in ROS 2";
  };
})
