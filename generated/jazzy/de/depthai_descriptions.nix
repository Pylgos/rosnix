{
  ament_cmake,
  buildRosPackage,
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
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "17a307160c2397657d95e13f659c906749528eb9";
        hash = "sha256-c+1HvxgESZN6Mgrn/RuTBMEZGs3VvhuR5in7s0/MT8Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_descriptions";
  version = "2.10.1-1";
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
