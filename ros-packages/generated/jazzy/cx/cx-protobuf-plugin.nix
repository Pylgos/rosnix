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
  version = "0.1.2-1";
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
        rev = "e21ca0572b13cd94673f380c2ca59cc20bc223bc";
        hash = "sha256-SMdhR+aSx06uLiDByWhf1WwS4Iiv0sagFDrQ4EL6JAw=";
      };
    };
  });
  meta = {
    description = "CX plugin to send and receive protobuf messages";
  };
})
