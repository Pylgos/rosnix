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
  version = "0.1.3-1";
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
        rev = "ccd120bc8a40123798787e2f8cd0c701022c6776";
        hash = "sha256-ZCL7K7cIIB4wrLG2nTBkqkeExZ2op2P6l9bODROo7HE=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin example that does not actually do anything and rather serves as boilerplate";
  };
})
