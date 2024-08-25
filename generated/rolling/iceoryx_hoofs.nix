{
  acl,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_hoofs = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "8970f0f7b3e819ba7aae5af2a5363d3efde96d86";
        hash = "sha256-C57YmMV/QQbRaySst8JrcobpnMXYdJ0EFLLY/Zi72ak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_hoofs";
  version = "2.0.5-5";
  src = sources.iceoryx_hoofs;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ acl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
}
