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
        rev = "2f62692079fe655eb34a51b2c22c2a8555b2a132";
        hash = "sha256-C57YmMV/QQbRaySst8JrcobpnMXYdJ0EFLLY/Zi72ak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_hoofs";
  version = "2.0.5-6";
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
