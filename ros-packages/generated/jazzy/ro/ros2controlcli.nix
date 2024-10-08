{
  buildRosPackage,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "e0015c7d37d3779c210b07f773c9afe0c90fcdc5";
        hash = "sha256-L9zKf80do8mQ+G6ucswZj9KfEKaLoUwdamqit7CbVC0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "ros2controlcli";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The ROS 2 command line tools for ROS2 Control.";
  };
})
