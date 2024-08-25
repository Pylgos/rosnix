{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate_parameter_library,
  geometry_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rcutils,
  realtime_tools,
  substituteSource,
}:
let
  sources = rec {
    control_toolbox = substituteSource {
      src = fetchgit {
        name = "control_toolbox-source";
        url = "https://github.com/ros2-gbp/control_toolbox-release.git";
        rev = "a7a4962446f6437bd7342af6510361947f880ef3";
        hash = "sha256-8k2Jlg4wFOuHFj1R/mlh8NMvgEGijDRy6kme0opUgm4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "control_toolbox";
  version = "3.2.0-3";
  src = sources.control_toolbox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs filters generate_parameter_library geometry_msgs pluginlib rclcpp rcutils realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest rclcpp_lifecycle ];
  missingDependencies = [  ];
  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
  };
}
