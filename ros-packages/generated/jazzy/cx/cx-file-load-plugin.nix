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
  version = "0.1.2-1";
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
        rev = "3819140289b0e7d300f0bb1b1a96f881d5c2f54b";
        hash = "sha256-Xfk2dZGCq5y9qaM1UIaUL0Qxyjq9wnBqShclC03mbbE=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin that can load CLIPS code via load* and batch*";
  };
})
