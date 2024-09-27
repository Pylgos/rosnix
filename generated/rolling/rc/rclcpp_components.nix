{
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_components-1d1c5c3e8cfd0687b0d6d42a8dcb59c39198deb7 = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-1d1c5c3e8cfd0687b0d6d42a8dcb59c39198deb7-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "1d1c5c3e8cfd0687b0d6d42a8dcb59c39198deb7";
        hash = "sha256-NHXUhYxy3ZHP5X39VQlUztrcbMFEboJOZSNd8xz9U84=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "28.3.3-1";
  src = sources.rclcpp_components-1d1c5c3e8cfd0687b0d6d42a8dcb59c39198deb7;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp class_loader composition_interfaces rclcpp rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_google_benchmark ament_cmake_gtest ament_lint_auto ament_lint_common launch_testing std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
}
