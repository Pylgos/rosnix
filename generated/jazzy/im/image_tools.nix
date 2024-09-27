{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rmw_implementation_cmake,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_tools-e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d = substituteSource {
      src = fetchgit {
        name = "image_tools-e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d";
        hash = "sha256-hRy5xFGeKMfoRZT1Od8NONXd3wCtorOEaYHJCHMrUH4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_tools";
  version = "0.33.5-1";
  src = sources.image_tools-e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tools to capture and play back images to and from DDS subscriptions and publications.";
  };
}
