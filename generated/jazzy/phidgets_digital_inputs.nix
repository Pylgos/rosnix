{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_digital_inputs = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "28b6e1c5cba7484cc3c576b6ea9baaa9fe9e7be5";
        hash = "sha256-taMmD3Mb/CxQDtrkT5cyYYpsjvqCfhPtQH88w96/tto=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_digital_inputs";
  version = "2.3.3-2";
  src = sources.phidgets_digital_inputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets Digital Input devices";
  };
}
