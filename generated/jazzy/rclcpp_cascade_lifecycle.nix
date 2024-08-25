{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cascade_lifecycle_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_cascade_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "c6b311bca5f6bbaba2fd5f5f98c68f26e3594638";
        hash = "sha256-tJ+QyrBJij5KGBc/C7qOJIbVs9xcT5mG8e6fFABi1wI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_cascade_lifecycle";
  version = "2.0.0-2";
  src = sources.rclcpp_cascade_lifecycle;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cascade_lifecycle_msgs lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
}
