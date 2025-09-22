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
  version = "2.0.0-1";
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
        rev = "8ff0d9c925a677263b079394289e0b1615199b70";
        hash = "sha256-yXijaF7iBusLGdElOcrqwiaRYyiYo8EGu1BJ8jTMy5I=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the Franka Emika Panda (FER) real robot.";
  };
})
