{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx-hoofs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "iceoryx_posh";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."iceoryx_posh";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "git" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs ];
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_posh" = substituteSource {
      src = fetchgit {
        name = "iceoryx_posh-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "c82b9046433716005cc688977c3505e6ece248b2";
        hash = "sha256-Z096TkookV3QfSxSF23Z3Nidmjg4N+zlXpIQVQkHCgw=";
      };
      substitutions = [
        {
          path = "cmake/cpptoml/cpptoml.cmake.in";
          from = "GIT_REPOSITORY    https://github.com/skystrife/cpptoml.git";
          to = "URL ${sources."iceoryx_posh/cpptoml"}";
        }
      ];
    };
    "iceoryx_posh/cpptoml" = substituteSource {
      src = fetchgit {
        name = "cpptoml-source";
        url = "https://github.com/skystrife/cpptoml.git";
        rev = "fededad7169e538ca47e11a9ee9251bc361a9a65";
        hash = "sha256-AOQFL94MIE3QgMHOesNTE6TQslfRql83/V/L1Un8vz8=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware Posix Shared Memory Library and middleware daemon (RouDi)";
  };
})
