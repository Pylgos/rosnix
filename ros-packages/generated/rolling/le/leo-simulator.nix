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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."leo_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_simulator" = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "84b4b9a89ce746e54fdb479d013eb98429444950";
        hash = "sha256-Gv0Gx58aYy8qfagNAjzxMfAAIcsuzYaXcecVSwcq0U0=";
      };
    };
  });
  meta = {
    description = "Metapackage for Leo Rover Gazebo simulation in ROS2";
  };
})
