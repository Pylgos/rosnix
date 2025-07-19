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
  pname = "cx_example_plugin";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_example_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "cx_example_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_example_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "c77843642501261d761a1148a88bec8b3fefafd7";
        hash = "sha256-e2g+ztN0zy/QYKOwZv4pzHWjYuCnaAxuTPHOgacQ/nY=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin example that does not actually do anything and rather serves as boilerplate";
  };
})
