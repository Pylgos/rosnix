{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    stereo_msgs-0888846426c3944223b3f65c780dce03a7d6b0a1 = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-0888846426c3944223b3f65c780dce03a7d6b0a1-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "0888846426c3944223b3f65c780dce03a7d6b0a1";
        hash = "sha256-gYP1t5Uq6u+ynppcnyCymLqe0G5VL91xa2dcfBAiDJQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_msgs";
  version = "5.4.1-1";
  src = sources.stereo_msgs-0888846426c3944223b3f65c780dce03a7d6b0a1;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
}
