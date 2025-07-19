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
  version = "0.1.2-1";
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
        rev = "adcf42e2357c2c9c2797cfacc07403e19d8d192e";
        hash = "sha256-JRybZKggHJRaUeFjWfpEKJO/F8jNWYU1HpmzZfUN7gM=";
      };
    };
  });
  meta = {
    description = "Base class for CLIPS plugins";
  };
})
