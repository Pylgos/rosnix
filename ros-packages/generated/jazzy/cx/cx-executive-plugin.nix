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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_executive_plugin";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_executive_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "cx_executive_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_executive_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "0f41f0edd6dffa0239b710961d465f9a327e3690";
        hash = "sha256-T4zmBe5PfB3D0oI9e9EF5+sVrLZ4rUeeUWambgcVpmY=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin to continuously refresh agendas and run CLIPS environments";
  };
})
