{
  ament-cmake,
  buildAmentCmakePackage,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  protobuf-comm,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_protobuf_plugin";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_protobuf_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-plugin cx-utils pluginlib protobuf-comm rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "protobuf" "python3-jinja2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-plugin cx-utils pluginlib protobuf-comm rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "protobuf" "python3-jinja2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cx_protobuf_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_protobuf_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "c22f5c81177d8f86e8a1b7facf3174ca693d4802";
        hash = "sha256-nN7ZDYbRS6Dx2mupM5j7iTcTHrVQ7p9nizeQgHcYmN8=";
      };
    };
  });
  meta = {
    description = "CX plugin to send and receive protobuf messages";
  };
})
