{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_cmake_version,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcutils,
  rosSystemPackages,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rmw-499c1b0af2fc088fa811ff6a75178a2768e8f783 = substituteSource {
      src = fetchgit {
        name = "rmw-499c1b0af2fc088fa811ff6a75178a2768e8f783-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "499c1b0af2fc088fa811ff6a75178a2768e8f783";
        hash = "sha256-iaAMT8jfhqNDehROSXfXgAGchBK1hONCLQxubgXZkRk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "7.4.3-1";
  src = sources.rmw-499c1b0af2fc088fa811ff6a75178a2768e8f783;
  nativeBuildInputs = [ ament_cmake_ros ament_cmake_version ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils rosidl_dynamic_typesupport rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common osrf_testing_tools_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains the ROS middleware API.";
  };
}
