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
  version = "0.1.3-2";
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
        rev = "13a71154a9d31c66af1d1636b6f7175dbfd1ab7a";
        hash = "sha256-O6jv5EsZvs5PRXFyKzYfHlSYZZLdAsQEMIer+OwWxAw=";
      };
    };
  });
  meta = {
    description = "Base class for CLIPS plugins";
  };
})
