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
  version = "2.9.3-1";
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
        rev = "65dff5cb64545fbf3259d32eede9e8e2e64fa33d";
        hash = "sha256-ckCXUhA1voQXDFEqNXcgPPrp8mwSC1VtAWFPK4kSZVA=";
      };
    };
  });
  meta = {
    description = "MoveIt configuration built around Clearpath Configuration";
  };
})
