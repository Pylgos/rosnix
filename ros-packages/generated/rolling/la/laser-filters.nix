{
  ament-cmake-auto,
  ament-cmake-gtest,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  laser-geometry,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "laser_filters" = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "6ad8d2b8f63eb700eda85dc14dbd49cbf12e3c69";
        hash = "sha256-ruSsWz10XSElakzxzN1wQp+rS0CVAcaNHQpoVnP0f3k=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "laser_filters";
  version = "2.0.7-2";
  src = sources."laser_filters";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles filters laser-geometry message-filters pluginlib rclcpp rclcpp-lifecycle sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type.";
  };
}
