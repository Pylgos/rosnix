{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  vrpn,
}:
let
  sources = mkSourceSet (sources: {
    "vrpn_mocap" = substituteSource {
      src = fetchgit {
        name = "vrpn_mocap-source";
        url = "https://github.com/ros2-gbp/vrpn_mocap-release.git";
        rev = "ff6e0e030ec5415d376d4e42d65f759e5454bdaf";
        hash = "sha256-qTdwB+YAkx59icepyKJgOykWlxF7kMMSSJ/EKm+NVWs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "vrpn-mocap";
  version = "1.1.0-3";
  src = sources."vrpn_mocap";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rclcpp std-msgs tf2 vrpn ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2";
  };
}
