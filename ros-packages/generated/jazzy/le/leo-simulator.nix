{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-gz-bringup,
  leo-gz-plugins,
  leo-gz-worlds,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_simulator";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."leo_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_simulator" = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "3d2e271014847b43477833551e550e08d806d540";
        hash = "sha256-AmM+za9Q8xrvUnoBQhs5WQf4eb83HyeD1vc2bhPwdgw=";
      };
    };
  });
  meta = {
    description = "Metapackage for Leo Rover Gazebo simulation in ROS2";
  };
})
