{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    odom_to_tf_ros2 = substituteSource {
      src = fetchgit {
        name = "odom_to_tf_ros2-source";
        url = "https://github.com/ros2-gbp/odom_to_tf_ros2-release.git";
        rev = "c40e00e711e76f042a70324930e2e99a93407c65";
        hash = "sha256-0/u/YYeXujwGxRaQtoi8WfVuy0NFu558FY9r5etmJkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "odom_to_tf_ros2";
  version = "1.0.2-3";
  src = sources.odom_to_tf_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A simple ros2 package (node) that reads an odom topic and generates the equivalent tf connection (transformation). It also provides options to override frame names, or just use the ones in the original odom topic.";
  };
}
