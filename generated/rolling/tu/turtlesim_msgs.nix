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
  substituteSource,
}:
let
  sources = rec {
    turtlesim_msgs-32803185ffaa1712359144f154fa283c7ee22ee9 = substituteSource {
      src = fetchgit {
        name = "turtlesim_msgs-32803185ffaa1712359144f154fa283c7ee22ee9-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "32803185ffaa1712359144f154fa283c7ee22ee9";
        hash = "sha256-9dFwJZsBR6QXBfY2HhiX0w5K8eOkSgPLyZpmykHcDe0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim_msgs";
  version = "1.9.2-1";
  src = sources.turtlesim_msgs-32803185ffaa1712359144f154fa283c7ee22ee9;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "turtlesim messages.";
  };
}
