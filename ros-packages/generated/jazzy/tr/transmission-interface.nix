{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "transmission_interface" = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "6d157fe6056ccfcee906c2c9dc6cb8146845d6b7";
        hash = "sha256-EbAKLaZBGF0Op1sTNdaOpU8QS6JECA+bhONZQ30zXqM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "transmission_interface";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."transmission_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ hardware-interface pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "transmission_interface contains data structures for representing mechanical transmissions, methods for propagating values between actuator and joint spaces and tooling to support this.";
  };
})
