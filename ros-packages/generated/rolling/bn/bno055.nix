{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    bno055-4e2ddd17b62b2c95d01aae53e8a9f2cdbccbe30c = substituteSource {
      src = fetchgit {
        name = "bno055-4e2ddd17b62b2c95d01aae53e8a9f2cdbccbe30c-source";
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
  src = sources.bno055-4e2ddd17b62b2c95d01aae53e8a9f2cdbccbe30c;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" "python3-smbus" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Bosch BNO055 IMU driver for ROS2";
  };
}
