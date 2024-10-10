{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "osqp_vendor" = substituteSource {
      src = fetchgit {
        name = "osqp_vendor-source";
        url = "https://github.com/ros2-gbp/osqp_vendor-release.git";
        rev = "581a58b5467b5dcdca551e613b4bb1e4d47e30e0";
        hash = "sha256-I6jhthmRppj6fiDd1M+bbW8W/bsR5/0ur5UWcf4/ZGQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/osqp/osqp.git";
          to = "URL ${sources."osqp_vendor/osqp"}";
        }
      ];
    };
    "osqp_vendor/osqp" = substituteSource {
      src = fetchgit {
        name = "osqp-source";
        url = "https://github.com/osqp/osqp.git";
        rev = "f9fc23d3436e4b17dd2cb95f70cfa1f37d122c24";
        hash = "sha256-RYk3zuZrJXPcF27eMhdoZAio4DZ+I+nFaUEg1g/aLNk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "osqp_vendor";
  version = "0.2.0-4";
  src = finalAttrs.passthru.sources."osqp_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Wrapper around osqp that ships with a CMake module";
  };
})
