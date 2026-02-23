{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  inverse-dynamics-solver,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_inria_inverse_dynamics_solver";
  version = "6.0.1-3";
  src = finalAttrs.passthru.sources."franka_inria_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "franka_inria_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "franka_inria_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "2e68596683ee7cff16b91defd85a289f4a94e889";
        hash = "sha256-9eUd/HBoeYBnQ8K4VBSXGFh0UdcFCXv1dEP2OM8PFz4=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the Franka Emika Panda (FER) real robot.";
  };
})
