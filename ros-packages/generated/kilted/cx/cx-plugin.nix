{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clips-vendor,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_plugin";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-utils pluginlib rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-utils pluginlib rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "ae7b4cd636ae6dfb7968c62ba1763edd82ff2e8c";
        hash = "sha256-r113sLhOMq8jzkb1A5vRr64+2hI48aHqupITOcBKrz0=";
      };
    };
  });
  meta = {
    description = "Base class for CLIPS plugins";
  };
})
