{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  kinematics-interface,
  mkSourceSet,
  pinocchio,
  pluginlib,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_pinocchio";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."kinematics_interface_pinocchio";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ kinematics-interface pinocchio pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_pinocchio" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_pinocchio-source";
        url = "https://github.com/justagist/kinematics_interface_pinocchio-release.git";
        rev = "1eeea72e03338a14f38b136bc16187807d7ed350";
        hash = "sha256-VntQLsQwkoHuDBYRBVq2fGMvoAmpVyFwrLchiRiCABw=";
      };
    };
  });
  meta = {
    description = "Pinocchio-based implementation of ros2_control kinematics interface";
  };
})
