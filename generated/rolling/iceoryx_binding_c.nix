{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_hoofs,
  iceoryx_posh,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_binding_c = substituteSource {
      src = fetchgit {
        name = "iceoryx_binding_c-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "b786ef1c655328235deb93898624923fd00444f9";
        hash = "sha256-MK/r8dSrJHO5SjuOTcRVaAOT5E8CXs0vOCivgRvoAbA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_binding_c";
  version = "2.0.5-5";
  src = sources.iceoryx_binding_c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs iceoryx_posh ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware C-Language Binding";
  };
}
