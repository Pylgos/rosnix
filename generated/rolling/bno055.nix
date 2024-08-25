{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    bno055 = substituteSource {
      src = fetchgit {
        name = "bno055-source";
        url = "https://github.com/ros2-gbp/bno055-release.git";
        rev = "4e2ddd17b62b2c95d01aae53e8a9f2cdbccbe30c";
        hash = "sha256-C8wFVPMD9UXtgtXX3T4ERtwtrr1IKIwYwiGzp1XWbS4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bno055";
  version = "0.5.0-2";
  src = sources.bno055;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces python3Packages.pyserial rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [ "python3-smbus" ];
  meta = {
    description = "Bosch BNO055 IMU driver for ROS2";
  };
}
