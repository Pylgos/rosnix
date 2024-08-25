{
  ament_cmake,
  buildRosPackage,
  ds_dbw_can,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw_joystick_demo = substituteSource {
      src = fetchgit {
        name = "ds_dbw_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "4fd5bd051b97be1e93f64ef84400d43d12ebd2d6";
        hash = "sha256-jVoMuLK571eFsrStIFvFwNR5FjL9qpA8I2qVXrot5MQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_joystick_demo";
  version = "2.2.0-1";
  src = sources.ds_dbw_joystick_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ds_dbw_can ds_dbw_msgs joy rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Demonstration of drive-by-wire with joystick";
  };
}
