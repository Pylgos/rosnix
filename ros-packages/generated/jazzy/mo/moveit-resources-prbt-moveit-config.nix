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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-support moveit-ros-move-group robot-state-publisher rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9d3d55c82237a47583441415d0f69748ffa0ccf3";
        hash = "sha256-PIPewmh2T1boe+I/jVlC1Weg6gP4O+52b6sazqkllTA=";
      };
    };
  });
  meta = {
    description = "";
  };
})
