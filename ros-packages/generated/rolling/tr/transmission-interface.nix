{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "transmission_interface";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."transmission_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface pluginlib ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "transmission_interface" = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7358ef42be162241e1c9e942ce6b759d12566017";
        hash = "sha256-YtscWXO6BLrwEeUAx0cYIu6mP5fwijkjz/p5pMG5kUc=";
      };
    };
  });
  meta = {
    description = "transmission_interface contains data structures for representing mechanical transmissions, methods for propagating values between actuator and joint spaces and tooling to support this.";
  };
})
