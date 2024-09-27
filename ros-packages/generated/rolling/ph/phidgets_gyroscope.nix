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
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_gyroscope-9a124bf6171fd1ac6d42166fad230f4d9b88c0d0 = substituteSource {
      src = fetchgit {
        name = "phidgets_gyroscope-9a124bf6171fd1ac6d42166fad230f4d9b88c0d0-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "9a124bf6171fd1ac6d42166fad230f4d9b88c0d0";
        hash = "sha256-umLPYnGNeRNHzYU1z5tXxDJe/QFYAnmXCCPxLFH4E5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_gyroscope";
  version = "2.3.3-1";
  src = sources.phidgets_gyroscope-9a124bf6171fd1ac6d42166fad230f4d9b88c0d0;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Gyroscope devices";
  };
}
