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
        rev = "b6cdab4298b874aa0be92af4c1d3c05c54edbf4b";
        hash = "sha256-ZCL7K7cIIB4wrLG2nTBkqkeExZ2op2P6l9bODROo7HE=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin example that does not actually do anything and rather serves as boilerplate";
  };
})
