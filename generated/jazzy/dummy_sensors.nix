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
        rev = "889f41619e9def6175f2a9281850c05867326aab";
        hash = "sha256-3UaemJ/hKSVf+gUdLXWjDIcmwQp3iNUt7MrpGq4qCRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_sensors";
  version = "0.33.5-1";
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
