{
  ament_cmake,
  ament_cmake_cpplint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    imu_processors = substituteSource {
      src = fetchFromGitHub {
        name = "imu_processors-source";
        owner = "ros2-gbp";
        repo = "imu_pipeline-release";
        rev = "438faa657139abc7315d8d38d35b125c385e812c";
        hash = "sha256-ShCwGu82++kzA8jDNQZHJIG8R7Av04iVDxp8sMYze2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_processors";
  version = "0.5.0-3";
  src = sources.imu_processors;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp rclcpp_components sensor_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cpplint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
}
