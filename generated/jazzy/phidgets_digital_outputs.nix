{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_digital_outputs = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "2ead02e0d424b0ae8a26ef0a84d165fdfc8825ae";
        hash = "sha256-KupijHg2trBRdHREmgsrAmrCxE0f+hnvA6BJOjIZ1Yc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_digital_outputs";
  version = "2.3.3-2";
  src = sources.phidgets_digital_outputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api phidgets_msgs rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets Digital Output devices";
  };
}
