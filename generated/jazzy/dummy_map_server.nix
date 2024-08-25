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
        rev = "f8815b91ab5967a8d0c1ee7a981b54ca3104000c";
        hash = "sha256-SnBrRYUgjHWEpniJMfpF3pQ+9D2yZ5wEvV5uvkw5hus=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.33.4-1";
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
