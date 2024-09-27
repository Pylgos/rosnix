{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    dynamixel_workbench_msgs-dc300702741bf35a25967aba0a7465a453890fca = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_msgs-dc300702741bf35a25967aba0a7465a453890fca-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench_msgs-release.git";
        rev = "dc300702741bf35a25967aba0a7465a453890fca";
        hash = "sha256-NMrVMFxbUmSDCdSRTO6gRJtKsmEeqY4Q5FqkBQCeY3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench_msgs";
  version = "2.0.3-5";
  src = sources.dynamixel_workbench_msgs-dc300702741bf35a25967aba0a7465a453890fca;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package includes ROS messages and services for dynamixel_workbench packages";
  };
}
