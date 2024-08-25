{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dummy_sensors = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7e3e27660fd19a184efb4e59881b2a7bc8dd57a7";
        hash = "sha256-cKpsUvA8UZzh02/237Xr4txRbltPht7AUTvn+cJruPg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_sensors";
  version = "0.33.4-1";
  src = sources.dummy_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "dummy sensor nodes";
  };
}
