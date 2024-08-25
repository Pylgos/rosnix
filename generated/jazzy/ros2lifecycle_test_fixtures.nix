{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    ros2lifecycle_test_fixtures = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ea85fa884c6417acf21d1d7e858f5379bc8e8b9c";
        hash = "sha256-L4zZbd8fMvXvo0n2Jf5wgcEM3qVeA0Hg0YgjMaWtXVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle_test_fixtures";
  version = "0.32.1-1";
  src = sources.ros2lifecycle_test_fixtures;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
}
