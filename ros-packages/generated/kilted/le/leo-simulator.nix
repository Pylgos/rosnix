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
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."leo_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_simulator" = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "a9703885360f3d703865863542398e5401a47c67";
        hash = "sha256-Gv0Gx58aYy8qfagNAjzxMfAAIcsuzYaXcecVSwcq0U0=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage for Leo Rover Gazebo simulation in ROS2\n  ";
  };
})
