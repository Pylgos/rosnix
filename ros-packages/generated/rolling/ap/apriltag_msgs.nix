{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    apriltag_msgs-555203ded954f72af530a0415c8ba5b356669d8c = substituteSource {
      src = fetchgit {
        name = "apriltag_msgs-555203ded954f72af530a0415c8ba5b356669d8c-source";
        url = "https://github.com/ros2-gbp/apriltag_msgs-release.git";
        rev = "555203ded954f72af530a0415c8ba5b356669d8c";
        hash = "sha256-8gmaJqHmANuH5XDGCZ8C29KjCY7QKQ8r2DSpl1jxp20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_msgs";
  version = "2.0.1-4";
  src = sources.apriltag_msgs-555203ded954f72af530a0415c8ba5b356669d8c;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "AprilTag message definitions";
  };
}
