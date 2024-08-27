{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_costmap_2d,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    costmap_queue = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "da08cfe50233ed3e54da9786f8b7bfdc32f2f07b";
        hash = "sha256-7Vx3j1lLqN2jVzMUhVfdA49s7LLJrh9n5/x1hu/UD4I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "costmap_queue";
  version = "1.3.2-1";
  src = sources.costmap_queue;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_common nav2_costmap_2d rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The costmap_queue package";
  };
}
