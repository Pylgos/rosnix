{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  octomap-msgs,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_py" = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b28cdc0b5a4ec7a3e2fa9027441d69a0d8bbcf50";
        hash = "sha256-YUZ7VENle6I0byyF3+fO3t4IYrnnCRam9u6Al0GTa2Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit-py";
  version = "2.11.0-1";
  src = sources."moveit_py";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python binding for MoveIt 2";
  };
}
