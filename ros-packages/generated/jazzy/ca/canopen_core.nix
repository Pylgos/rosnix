{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = mkSourceSet (sources: {
    "canopen_core" = substituteSource {
      src = fetchgit {
        name = "canopen_core-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "4121a85cba89840b28dfa6a7a0737946e3418555";
        hash = "sha256-FGvB62WkL47PY/x3FNDlblrjJJWiKutqhX/flTV/z9Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "canopen_core";
  version = "0.2.9-2";
  src = sources."canopen_core";
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
