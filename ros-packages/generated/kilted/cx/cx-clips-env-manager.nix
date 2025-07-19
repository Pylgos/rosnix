{
  ament-cmake,
  bond,
  bondcpp,
  buildAmentCmakePackage,
  clips-vendor,
  cx-msgs,
  cx-plugin,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_clips_env_manager";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_clips_env_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bond bondcpp clips-vendor cx-msgs cx-plugin lifecycle-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp clips-vendor cx-msgs cx-plugin lifecycle-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "cx_clips_env_manager" = substituteSource {
      src = fetchgit {
        name = "cx_clips_env_manager-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "9455dd911edb07257f1379b9c4eb77a271bb27ef";
        hash = "sha256-KoOHafFkOeVYL6kTuyHEmDnOJUVtqgvJyC7DOdN5sVY=";
      };
    };
  });
  meta = {
    description = "Lifecycle node for managing CLIPS environments";
  };
})
