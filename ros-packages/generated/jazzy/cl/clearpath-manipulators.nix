{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-manipulators-description,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-planners-chomp,
  moveit-ros-move-group,
  moveit-ros-warehouse,
  moveit-simple-controller-manager,
  position-controllers,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_manipulators";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-manipulators-description gripper-controllers moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-warehouse moveit-simple-controller-manager position-controllers tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "e50eeca639a2223ebd485a8cc5f1b02f72157b6d";
        hash = "sha256-M50yS/ecIf68wzo93h42G3mgSDzzKxvxwj7ocSzqZYs=";
      };
    };
  });
  meta = {
    description = "MoveIt configuration built around Clearpath Configuration";
  };
})
