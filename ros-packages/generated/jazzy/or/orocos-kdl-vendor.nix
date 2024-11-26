{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orocos_kdl_vendor";
  version = "0.5.1-2";
  src = finalAttrs.passthru.sources."orocos_kdl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "adca6201616af928533d70faea6042fe0239e898";
        hash = "sha256-LHj4WXKVrh8UKDJyfN3lT7gTuGCu0j5eAiN0bigrN2Q=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/orocos/orocos_kinematics_dynamics.git";
          to = "VCS_TYPE path VCS_URL ${sources."orocos_kdl_vendor/orocos_kinematics_dynamics"}";
        }
      ];
    };
    "orocos_kdl_vendor/orocos_kinematics_dynamics" = substituteSource {
      src = fetchgit {
        name = "orocos_kinematics_dynamics-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics.git";
        rev = "ce4bcb65a050615b6d7f21bc60fbb2656515791b";
        hash = "sha256-CfmwMQEg/tRVNaGglBZ94pBwva49mJJwkbSjhqzG2Pw=";
      };
    };
  });
  meta = {
    description = "Wrapper around orocos_kdl, providing nothing but a dependency on orocos_kdl on some systems. On others, it fetches and builds orocos_kdl locally.";
  };
})
