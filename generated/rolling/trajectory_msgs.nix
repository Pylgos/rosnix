{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
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
    trajectory_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "trajectory_msgs-source";
        owner = "ros2-gbp";
        repo = "common_interfaces-release";
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
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
}
