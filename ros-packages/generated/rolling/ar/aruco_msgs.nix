{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    aruco_msgs-7938091ebd1c7023cfed193add32d60e10f9d672 = substituteSource {
      src = fetchgit {
        name = "aruco_msgs-7938091ebd1c7023cfed193add32d60e10f9d672-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "7938091ebd1c7023cfed193add32d60e10f9d672";
        hash = "sha256-EUZsF13naoL/xNnzsHHJmDuodN/Bb15EI1Pc+ZV2bHk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_msgs";
  version = "5.0.5-1";
  src = sources.aruco_msgs-7938091ebd1c7023cfed193add32d60e10f9d672;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The aruco_msgs package";
  };
}
