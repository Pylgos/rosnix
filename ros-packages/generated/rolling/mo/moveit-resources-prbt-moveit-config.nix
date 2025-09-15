{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-prbt-ikfast-manipulator-plugin,
  moveit-resources-prbt-support,
  moveit-ros-move-group,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-support moveit-ros-move-group robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-support moveit-ros-move-group robot-state-publisher rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3e9fbb92d98172833b62b750457cceb1b1145798";
        hash = "sha256-Ck6PkWe3G4hjYf9Fd148ClalHGlHvDROvhN4AaouPtE=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
