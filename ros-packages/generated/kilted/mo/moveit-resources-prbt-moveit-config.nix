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
  version = "2.13.2-2";
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
        rev = "8a52aeb62e4026b1c254d4dcd1025c80edca822e";
        hash = "sha256-Opx8KdNonMfoZbuVfAFH7Cz3sjPnRqdc2qwBFhtKCm0=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
