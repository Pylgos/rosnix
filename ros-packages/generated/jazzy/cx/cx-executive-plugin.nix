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
  version = "0.1.3-1";
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
        rev = "ac23228158312e6fe0889d7a3509fc16604a468e";
        hash = "sha256-9+DhNX+v/rAtctIACJHKeLDLJjA32eXCNVXKHMHVytc=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin to continuously refresh agendas and run CLIPS environments";
  };
})
