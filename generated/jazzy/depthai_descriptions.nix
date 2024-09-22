{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    depthai_descriptions = substituteSource {
      src = fetchFromGitHub {
        name = "depthai_descriptions-source";
        owner = "luxonis";
        repo = "depthai-ros-release";
        rev = "5c8f7798dd92860fa8e6ae9c3683042ac8ff40d2";
        hash = "sha256-bKui5e94Pfu+Atg5NhtWf/dyiZGIpGOmOlczktCQVuY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_descriptions";
  version = "2.10.0-1";
  src = sources.depthai_descriptions;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot_state_publisher xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai_descriptions package";
  };
}
