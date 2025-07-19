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
  version = "0.1.1-1";
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
        rev = "7c36758fcf93aaf433051eeeba94b4547adddb06";
        hash = "sha256-oWD7dhUfb7oIWW10aN3whf4wteh8gBxR9xU82uSIjBk=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin example that does not actually do anything and rather serves as boilerplate";
  };
})
