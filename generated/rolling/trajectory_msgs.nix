{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    trajectory_msgs = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "5f93e172df3020f096b3d40e4363c3224203619b";
        hash = "sha256-+ROlHaK1FTpimKA3Bb6AvOzeCJ6/RHYbOFIvWQyl+X0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trajectory_msgs";
  version = "5.4.1-1";
  src = sources.trajectory_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
}
