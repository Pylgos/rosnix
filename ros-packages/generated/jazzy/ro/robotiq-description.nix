{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  launch,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robotiq_description";
  version = "0.0.1-3";
  src = finalAttrs.passthru.sources."robotiq_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher-gui launch launch-ros robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "robotiq_description" = substituteSource {
        src = fetchgit {
          name = "robotiq_description-source";
          url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
          rev = "4131e61c1f07d1e4deeef87ac2f4da3a8e2e6637";
          hash = "sha256-CO6k93lrA+H92beTQuG1tnfMsO99+vpYtYXmfABHcr4=";
        };
      };
    });
  };
  meta = {
    description = "URDF and xacro description package for the Robotiq gripper.";
  };
})
