{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    realtime_tools = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "91d15b9a3f699da477e644ad53208cbd93a9b8b1";
        hash = "sha256-mJ0j1sX7BpeTC7S7CmAoZXA0XLrOcy22ZW4+t0CWR4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realtime_tools";
  version = "2.6.0-1";
  src = sources.realtime_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock lifecycle_msgs rclcpp_lifecycle test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
}
