{
  ament-cmake,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-kdl,
  trac-ik-lib,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trac_ik_kinematics_plugin";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."trac_ik_kinematics_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ class-loader generate-parameter-library moveit-core pluginlib rclcpp tf2-kdl trac-ik-lib urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader generate-parameter-library moveit-core pluginlib rclcpp tf2-kdl trac-ik-lib urdf ];
  passthru.sources = mkSourceSet (sources: {
    "trac_ik_kinematics_plugin" = substituteSource {
      src = fetchgit {
        name = "trac_ik_kinematics_plugin-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "e608e52b92b8e9306bc8ef4ae7488bc8c90350df";
        hash = "sha256-Xj4omXPV8GY+CWCUvSBOT33WTxVQiW0A8N57S5bpDNo=";
      };
    };
  });
  meta = {
    description = "A MoveIt! Kinematics plugin using TRAC-IK";
  };
})
