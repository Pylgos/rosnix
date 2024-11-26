{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "steering_functions";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."steering_functions";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "steering_functions" = substituteSource {
      src = fetchgit {
        name = "steering_functions-source";
        url = "https://github.com/ros2-gbp/steering_functions-release.git";
        rev = "6bc9fd51c83a1040d0e1a7f66aca7dfa3a716611";
        hash = "sha256-pU2fKTdPvxp9CHgQpy478rFkO/GvfwD54b2lnQlOAcE=";
      };
    };
  });
  meta = {
    description = "The steering_functions package";
  };
})
