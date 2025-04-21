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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-manipulators-description gripper-controllers moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-warehouse moveit-simple-controller-manager position-controllers tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "9dc50af1b5ae18e970feb145f3702e5a15b30b12";
        hash = "sha256-5fP0butvczMucIT6ox46BGdo3Kt7LeDb3pJHjf1P+uY=";
      };
    };
  });
  meta = {
    description = "MoveIt configuration built around Clearpath Configuration";
  };
})
