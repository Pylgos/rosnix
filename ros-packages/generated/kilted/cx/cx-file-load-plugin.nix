{
  ament-cmake,
  buildAmentCmakePackage,
  clips-vendor,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_file_load_plugin";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_file_load_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "cx_file_load_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_file_load_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "7d24dc225e257909359853b48e105fc0d0af40e1";
        hash = "sha256-OeZTAjMoh/PL9uwJGmDo6iYPQGqXKs5NofeE2+zjRSI=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin that can load CLIPS code via load* and batch*";
  };
})
