{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_hoofs-2f62692079fe655eb34a51b2c22c2a8555b2a132 = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-2f62692079fe655eb34a51b2c22c2a8555b2a132-source";
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
  src = sources.iceoryx_hoofs-2f62692079fe655eb34a51b2c22c2a8555b2a132;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "acl" "libatomic" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
}
