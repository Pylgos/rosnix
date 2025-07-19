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
  version = "0.1.2-1";
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
        rev = "d0c5be51626e22bb096cfeda53e2056630e1edb6";
        hash = "sha256-9t5I6MATq0h0ygh3Ybvrqva8J/KDOH1MZO+Ll16ktZ0=";
      };
    };
  });
  meta = {
    description = "Lifecycle node for managing CLIPS environments";
  };
})
