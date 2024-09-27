{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_system_modes,
  rclcpp,
  rclcpp_lifecycle,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  system_modes,
  system_modes_msgs,
}:
let
  sources = rec {
    system_modes_examples-efafc561c71f87b7885dc945ae9d0ef4ce2efb0a = substituteSource {
      src = fetchgit {
        name = "system_modes_examples-efafc561c71f87b7885dc945ae9d0ef4ce2efb0a-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "efafc561c71f87b7885dc945ae9d0ef4ce2efb0a";
        hash = "sha256-0kfAi8ExAnUicuzTFtWKNQwRZP8qipcdbz4XUrg7EQM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_modes_examples";
  version = "0.9.0-5";
  src = sources.system_modes_examples-efafc561c71f87b7885dc945ae9d0ef4ce2efb0a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch launch_system_modes rclcpp rclcpp_lifecycle ros2launch system_modes system_modes_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_gmock ament_cmake_gtest ament_cmake_pep257 ament_cmake_uncrustify ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example systems and according launch files for the system_modes package.";
  };
}
