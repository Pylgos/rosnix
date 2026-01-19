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
  version = "2.0.2-1";
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
        rev = "761a100ae88f44320bca39b07e63a08ee0a147ee";
        hash = "sha256-AqbzM/9QLIKlFFj2/wnHFUNHZDkRWsD+xTA7Lo6aFCg=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the Franka Emika Panda (FER) real robot.";
  };
})
