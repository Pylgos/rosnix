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
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ibeo_msgs-7b2b41c497c5067996da1c998296fa859ebb05f2 = substituteSource {
      src = fetchgit {
        name = "ibeo_msgs-7b2b41c497c5067996da1c998296fa859ebb05f2-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "7b2b41c497c5067996da1c998296fa859ebb05f2";
        hash = "sha256-RLaDU8WKC534uEb0HZcS/iP0//JhyyaFVG8osixglEY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ibeo_msgs";
  version = "4.0.0-3";
  src = sources.ibeo_msgs-7b2b41c497c5067996da1c998296fa859ebb05f2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ibeo_msgs package";
  };
}
