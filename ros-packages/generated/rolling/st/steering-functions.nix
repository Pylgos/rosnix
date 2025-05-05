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
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "steering_functions" = substituteSource {
      src = fetchgit {
        name = "steering_functions-source";
        url = "https://github.com/ros2-gbp/steering_functions-release.git";
        rev = "1c8c2cea1c632f90d1f93b7f84df8ab07732606a";
        hash = "sha256-pU2fKTdPvxp9CHgQpy478rFkO/GvfwD54b2lnQlOAcE=";
      };
    };
  });
  meta = {
    description = "The steering_functions package";
  };
})
