{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-description,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-ros-move-group,
  moveit-simple-controller-manager,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_moveit_config";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."ewellix_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-simple-controller-manager tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-simple-controller-manager tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ewellix_moveit_config-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "fcb70550e6d8126b84e5129794fc37bd7b0fcab5";
        hash = "sha256-nKr8LF+ZGuH5oL9WbwgHjPo1t72Ln8XFZvhTnf/sSQA=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the ewellix_lift with the MoveIt Motion Planning Framework\n  ";
  };
})
