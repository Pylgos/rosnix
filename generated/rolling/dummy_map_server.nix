{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dummy_map_server = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "013262b4101af3984b2783493b5891d248ba0f04";
        hash = "sha256-gy4gx1dyM0ezKzQen9Q6Mnpx5IKPpthH+UePo7rzaw0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.34.2-1";
  src = sources.dummy_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "dummy map server node";
  };
}
