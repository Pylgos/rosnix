{
  ament-cmake,
  ament-cmake-cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "imu_processors" = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "438faa657139abc7315d8d38d35b125c385e812c";
        hash = "sha256-ShCwGu82++kzA8jDNQZHJIG8R7Av04iVDxp8sMYze2g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "imu-processors";
  version = "0.5.0-3";
  src = sources."imu_processors";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cpplint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
}
