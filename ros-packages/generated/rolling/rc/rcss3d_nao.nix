{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  nao_lola_command_msgs,
  nao_lola_sensor_msgs,
  rclcpp_components,
  rcss3d_agent,
  rcss3d_agent_msgs_to_soccer_interfaces,
  rosSystemPackages,
  sensor_msgs,
  soccer_vision_3d_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcss3d_nao" = substituteSource {
      src = fetchgit {
        name = "rcss3d_nao-source";
        url = "https://github.com/ros2-gbp/rcss3d_nao-release.git";
        rev = "eca4398e014f5149e7dfddd70953dc5e0a3b260f";
        hash = "sha256-gDCJv4U5VGvPzE6+9SysE6xYUMNx7KGRawSEwZp7sVM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcss3d_nao";
  version = "1.2.0-2";
  src = sources."rcss3d_nao";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nao_lola_command_msgs nao_lola_sensor_msgs rclcpp_components rcss3d_agent rcss3d_agent_msgs_to_soccer_interfaces sensor_msgs soccer_vision_3d_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An interface to SimSpark that uses interfaces used by a Nao robot";
  };
}