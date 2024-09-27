{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  picknik_ament_copyright,
  rclcpp,
  ros2_control_test_assets,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_based_ros2_control-26c2db948ee965568b80e037bfa57e6cb85f87a0 = substituteSource {
      src = fetchgit {
        name = "topic_based_ros2_control-26c2db948ee965568b80e037bfa57e6cb85f87a0-source";
        url = "https://github.com/ros2-gbp/topic_based_ros2_control-release.git";
        rev = "26c2db948ee965568b80e037bfa57e6cb85f87a0";
        hash = "sha256-SEfc/iqNZsxrD/m/f0CKmIfgo4mFGeziwqBv/ZXj1lM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_based_ros2_control";
  version = "0.2.0-3";
  src = sources.topic_based_ros2_control-26c2db948ee965568b80e037bfa57e6cb85f87a0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles hardware_interface rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common picknik_ament_copyright ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2 control hardware interface for topic_based sim";
  };
}
