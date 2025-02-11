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
  version = "4.26.0-1";
  src = finalAttrs.passthru.sources."transmission_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ hardware-interface pluginlib ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "transmission_interface" = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "0841f1d6666083223246750b5fd364151eea7b00";
        hash = "sha256-zJR4HnYHOGMtm/z0YPmwgCo+FJsDSFwRnBZpAuiCyh8=";
      };
    };
  });
  meta = {
    description = "transmission_interface contains data structures for representing mechanical transmissions, methods for propagating values between actuator and joint spaces and tooling to support this.";
  };
})
