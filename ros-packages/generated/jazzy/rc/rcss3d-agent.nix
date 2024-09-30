{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcss3d-agent-msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcss3d_agent" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "df2d12c89346565c8f54bc45259cb0c19d54c820";
        hash = "sha256-U3T+91EoVbYapHoNLcIBJqlUz/YI9BB5jc7jAEpVpZw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcss3d_agent";
  version = "0.4.1-4";
  src = sources."rcss3d_agent";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rcss3d-agent-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launches a RoboCup 3D Simulation Agent, and converts data to and from ROS2 msgs";
  };
}
