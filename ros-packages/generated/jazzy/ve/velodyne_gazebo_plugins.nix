{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "velodyne_gazebo_plugins" = substituteSource {
      src = fetchgit {
        name = "velodyne_gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "b222a126f184cb5576c83c2160991304727f5506";
        hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-4";
  src = sources."velodyne_gazebo_plugins";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gazebo_msgs rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_dev" "gazebo_ros" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo plugin to provide simulated data from Velodyne laser scanners.";
  };
}
