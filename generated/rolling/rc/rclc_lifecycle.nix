{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  osrf_testing_tools_cpp,
  rcl_lifecycle,
  rclc,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_lifecycle-20317ad1b89212bf608c06c988dbd1ee3039fc55 = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-20317ad1b89212bf608c06c988dbd1ee3039fc55-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "20317ad1b89212bf608c06c988dbd1ee3039fc55";
        hash = "sha256-S6rPft/BC8XXLe0C9UCT8oPlYVqM0Vvvoj1MqVoApNQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "6.1.0-2";
  src = sources.rclc_lifecycle-20317ad1b89212bf608c06c988dbd1ee3039fc55;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle_msgs rcl_lifecycle rclc std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common osrf_testing_tools_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
}
