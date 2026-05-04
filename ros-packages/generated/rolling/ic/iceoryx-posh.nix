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
  propagatedNativeBuildInputs = [ iceoryx-hoofs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "git" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs ];
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_posh" = substituteSource {
      src = fetchgit {
        name = "iceoryx_posh-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "0659322c56049c1bd3ac442988ae3211312e2e72";
        hash = "sha256-z4UbiBniOOmxvdjXQKKxONivpiCgBaWujBb9Kf9fy+4=";
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
