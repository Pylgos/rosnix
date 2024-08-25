{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  rclcpp,
  rclcpp_components,
  ros_environment,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensorlib = substituteSource {
      src = fetchgit {
        name = "mrpt_sensorlib-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "b37a818caab0e7377bb9c9f3b659e94726c5b8ed";
        hash = "sha256-WrpLAqrGRw7ffVWlIqMLfmorb0I4JqT+Gbn5i36L2Ds=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensorlib";
  version = "0.2.2-1";
  src = sources.mrpt_sensorlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mrpt_msgs rclcpp rclcpp_components tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ library for the base generic MRPT sensor node";
  };
}
