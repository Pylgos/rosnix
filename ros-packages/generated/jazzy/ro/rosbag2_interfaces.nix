{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_interfaces-21c0781c7d4c7a7da582af9a69eb31ddcfa8515b = substituteSource {
      src = fetchgit {
        name = "rosbag2_interfaces-21c0781c7d4c7a7da582af9a69eb31ddcfa8515b-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "21c0781c7d4c7a7da582af9a69eb31ddcfa8515b";
        hash = "sha256-l61AtnEZNZlowQbj99kEvu7QsDHxjnzGRjhAvdMLHus=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_interfaces";
  version = "0.26.5-1";
  src = sources.rosbag2_interfaces-21c0781c7d4c7a7da582af9a69eb31ddcfa8515b;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
}
