{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_cbg_executor = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "59a1ddcd3150eb580a593adb64d43f384191df5a";
        hash = "sha256-f/zcFuUwgYeNFnSm15GE7RBebIioaCa8/9yyIWYd6sY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_cbg_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Example for multiple Executor instances in one process, using the callback-group-level interface of the Executor class.";
  };
}
