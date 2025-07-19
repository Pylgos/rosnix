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
  version = "0.1.1-1";
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
        rev = "371a992ea2d66b0e08323e77a8d847f23a0f7b6d";
        hash = "sha256-zUIZs1y4GbwXiRI+yVWXepZJiY4/QENOmD6kUQE9fKE=";
      };
    };
  });
  meta = {
    description = "CX plugin to send and receive protobuf messages";
  };
})
