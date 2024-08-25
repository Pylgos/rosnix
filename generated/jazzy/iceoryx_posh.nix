{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  iceoryx_hoofs,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_posh = substituteSource {
      src = fetchgit {
        name = "iceoryx_posh-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "0bdf67fa301f17d3d141f07f6a038018ace95953";
        hash = "sha256-6VuZh+ArFljLw8Bw7qp7V7J5VAGvxF2WtzfcaOeFIfQ=";
      };
      substitutions = [
        {
          path = "cmake/cpptoml/cpptoml.cmake.in";
          from = "GIT_REPOSITORY    https://github.com/skystrife/cpptoml.git";
          to = "URL ${iceoryx_posh-vendor_source-cpptoml-0}";
        }
      ];
    };
    iceoryx_posh-vendor_source-cpptoml-0 = substituteSource {
      src = fetchgit {
        name = "iceoryx_posh-vendor_source-cpptoml-0-source";
        url = "https://github.com/skystrife/cpptoml.git";
        rev = "fededad7169e538ca47e11a9ee9251bc361a9a65";
        hash = "sha256-AOQFL94MIE3QgMHOesNTE6TQslfRql83/V/L1Un8vz8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_posh";
  version = "2.0.5-6";
  src = sources.iceoryx_posh;
  nativeBuildInputs = [ cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware Posix Shared Memory Library and middleware daemon (RouDi)";
  };
}
