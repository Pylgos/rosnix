{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  dwb-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "dwb_core" = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d601c7ec253305ccf6fef058cd1aaf913bfa9c1a";
        hash = "sha256-CxMMRdvdGeXbpXUmbJZ4RD5D+N8vMBzpzTF5GWasHLI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dwb_core";
  version = "1.3.2-1";
  src = sources."dwb_core";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dwb-msgs geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "DWB core interfaces package";
  };
}
