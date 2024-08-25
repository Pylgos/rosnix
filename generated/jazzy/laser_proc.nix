{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    laser_proc = substituteSource {
      src = fetchgit {
        name = "laser_proc-source";
        url = "https://github.com/ros2-gbp/laser_proc-release.git";
        rev = "089952614224b15fcc4e69539094e10a651c626e";
        hash = "sha256-h2lPjaJimCF/20eVEH3+ZS7CDqoML9voXq2B0x32NSY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_proc";
  version = "1.0.2-7";
  src = sources.laser_proc;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "laser_proc";
  };
}
