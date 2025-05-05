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
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_description" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_description-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "e16d144a00d18aca35f290be42ad676bb48c3009";
        hash = "sha256-QNiGkOrGC3k96VBL7Csc3+9fZTtN6fIuhoKg9HworgQ=";
      };
    };
  });
  meta = {
    description = "open_manipulator_description ROS 2 package.";
  };
})
