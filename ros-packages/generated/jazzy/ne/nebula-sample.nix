{
  autoware-cmake,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-ros,
  nebula-msgs,
  nebula-sample-common,
  nebula-sample-decoders,
  nebula-sample-hw-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_sample";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_sample";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-ros nebula-msgs nebula-sample-common nebula-sample-decoders nebula-sample-hw-interfaces rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-ros nebula-msgs nebula-sample-common nebula-sample-decoders nebula-sample-hw-interfaces rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_sample" = substituteSource {
      src = fetchgit {
        name = "nebula_sample-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "ae35f16e2565876965b5827af6da3b32192ad176";
        hash = "sha256-vl5dtTPxrmzevlCiWbWxQwx8Me8na1fH56cJnL2Y+Mc=";
      };
    };
  });
  meta = {
    description = "Nebula Sample ROS 2 Package";
  };
})
