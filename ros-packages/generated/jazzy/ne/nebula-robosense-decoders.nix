{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  nebula-robosense-common,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_robosense_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_robosense_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-decoders nebula-robosense-common rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-decoders nebula-robosense-common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_robosense_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_robosense_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "1f9c8debb57cf7e855a751d2e69c2d97ef12511f";
        hash = "sha256-uJVLMSYW/XXiiLl/Vzdf96Phg4jI+KZIPtpSET+Wtak=";
      };
    };
  });
  meta = {
    description = "Nebula Robosense Decoders Library";
  };
})
