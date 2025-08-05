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
  version = "2.0.2-1";
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
        rev = "40e3b0fb949bfaa7dfe3f911fc7695ad5f8cfc1a";
        hash = "sha256-Sj3CYBOA45I/cB6RP/w0PGDtiry9z+4w7bSuWoSQXSo=";
      };
    };
  });
  meta = {
    description = "A MoveIt! Kinematics plugin using TRAC-IK";
  };
})
