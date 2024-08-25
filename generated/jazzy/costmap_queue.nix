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
        rev = "1f791537476975e56df5859d08dc3cdf58cb8ab8";
        hash = "sha256-6lIFNLqzNSGnQ/hnp6EG6mF7N4vBO88qTmMeIh2PE1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "costmap_queue";
  version = "1.3.1-1";
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
