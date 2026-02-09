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
  moveit-setup-srdf-plugins,
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
  version = "2.8.5-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-manipulators-description gripper-controllers moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-warehouse moveit-setup-srdf-plugins moveit-simple-controller-manager position-controllers tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-manipulators-description gripper-controllers moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-warehouse moveit-setup-srdf-plugins moveit-simple-controller-manager position-controllers tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "bd8e5bafeca7c109c4d736c3f43f145a4a6abb49";
        hash = "sha256-/srCbSbkAF9/brePZXcLgGIY1l117IVflidT3WJH9T8=";
      };
    };
  });
  meta = {
    description = "MoveIt configuration built around Clearpath Configuration";
  };
})
