{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_description";
  version = "4.0.7-1";
  src = finalAttrs.passthru.sources."open_manipulator_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_description" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_description-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "77a749205010cf95d3c0bec9c1ba6ff66e356b4c";
        hash = "sha256-WAvevIPkb7sevuOO+aYrGpbCQUJ8GpdSOKLKkA2L4HY=";
      };
    };
  });
  meta = {
    description = "\n    open_manipulator_description ROS 2 package.\n  ";
  };
})
