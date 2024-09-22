{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    odom_to_tf_ros2 = substituteSource {
      src = fetchFromGitHub {
        name = "odom_to_tf_ros2-source";
        owner = "ros2-gbp";
        repo = "odom_to_tf_ros2-release";
        rev = "cdb19962a1ac17d970b355a94691a32d54b87c35";
        hash = "sha256-0/u/YYeXujwGxRaQtoi8WfVuy0NFu558FY9r5etmJkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "odom_to_tf_ros2";
  version = "1.0.2-4";
  src = sources.odom_to_tf_ros2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav_msgs rclcpp tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A simple ros2 package (node) that reads an odom topic and generates the equivalent tf connection (transformation). It also provides options to override frame names, or just use the ones in the original odom topic.";
  };
}
