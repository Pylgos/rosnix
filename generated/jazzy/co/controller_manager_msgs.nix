{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    controller_manager_msgs-62dc0aacc3b02635167ad74d3864b3ee052cd091 = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-62dc0aacc3b02635167ad74d3864b3ee052cd091-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "62dc0aacc3b02635167ad74d3864b3ee052cd091";
        hash = "sha256-Fg0EJj/nzK+Jz0PTRMUeZaMbFi0IJ2KvTPQW7XpDHIw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager_msgs";
  version = "4.17.0-1";
  src = sources.controller_manager_msgs-62dc0aacc3b02635167ad74d3864b3ee052cd091;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages and services for the controller manager.";
  };
}
