{
  actionlib_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosSystemPackages,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
  trajectory_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    common_interfaces = substituteSource {
      src = fetchgit {
        name = "common_interfaces-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "d3cd7bc2ac70c1f793bb486b8890a3e705d51955";
        hash = "sha256-wxRD1b3gGcPbjpovwadMlw+A3m7bfdNsaOyxgcA/lSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "common_interfaces";
  version = "5.3.5-1";
  src = sources.common_interfaces;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ actionlib_msgs builtin_interfaces diagnostic_msgs geometry_msgs nav_msgs sensor_msgs shape_msgs std_msgs std_srvs stereo_msgs trajectory_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "common_interfaces contains messages and services that are widely used by other ROS packages.";
  };
}
