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
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "common_interfaces" = substituteSource {
      src = fetchgit {
        name = "common_interfaces-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "5bdd17489af0e10295441cf99d06ea662173c04a";
        hash = "sha256-sY3G36Si+RGICbER9vogXSz2Ooba4wre6O0uI78NBKw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "common_interfaces";
  version = "5.4.1-1";
  src = sources."common_interfaces";
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
