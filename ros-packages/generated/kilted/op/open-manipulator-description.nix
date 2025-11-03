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
  version = "4.1.0-1";
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
        rev = "f760a6109aae55f391dd9712506edd81bd9f1be2";
        hash = "sha256-l3xhZjqUnUDrEtx7Y9DvJm7y7v+PeWSxpoNTWMDFwK4=";
      };
    };
  });
  meta = {
    description = "\n    open_manipulator_description ROS 2 package.\n  ";
  };
})
