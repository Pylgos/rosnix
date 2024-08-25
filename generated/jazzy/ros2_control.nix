{
  ament_cmake,
  buildRosPackage,
  controller_interface,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  joint_limits,
  ros2_control_test_assets,
  ros2controlcli,
  substituteSource,
  transmission_interface,
}:
let
  sources = rec {
    ros2_control = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "158ff877d5ece16484df0fdf6bd59dfc72a0bd8a";
        hash = "sha256-ItJUKJ84Z+pSKeDgv8HGsDcjPDdpBRy26g3aSw3BZi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control";
  version = "4.15.0-1";
  src = sources.ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface controller_manager controller_manager_msgs hardware_interface joint_limits ros2_control_test_assets ros2controlcli transmission_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
}
