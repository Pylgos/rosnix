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
        rev = "0c0ab58c2d2618f0781968ab0d8d8f8dc7a3b892";
        hash = "sha256-LeLk1Gd5lyuzgq6dq0QzU4us8NtAkbRIK6sEEKIYVJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle_test_fixtures";
  version = "0.34.1-1";
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
