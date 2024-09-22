{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    canopen_core = substituteSource {
      src = fetchFromGitHub {
        name = "canopen_core-source";
        owner = "ros2-gbp";
        repo = "ros2_canopen-release";
        rev = "23063f5f0371cb8c8d997c7a00cb5a1b2a6e6303";
        hash = "sha256-fYhg6RaztX+p+lFzVCRADsxQLq4G0yuwwDPIjyYoVbg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_core";
  version = "0.2.12-2";
  src = sources.canopen_core;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_interfaces lely_core_libraries lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Core ros2_canopen functionalities such as DeviceContainer and master";
  };
}
