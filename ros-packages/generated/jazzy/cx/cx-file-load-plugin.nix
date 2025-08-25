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
  version = "0.1.3-1";
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
        rev = "862a25e633926d5da74828ae97dd2d9d5c4fe9e3";
        hash = "sha256-kHNMVlQhuiRlkv3zr2iWW5jNkHb0Xv+pLcMkXVl66WA=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin that can load CLIPS code via load* and batch*";
  };
})
