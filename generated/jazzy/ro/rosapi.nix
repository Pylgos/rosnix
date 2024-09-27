{
  ament_cmake_pytest,
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcl_interfaces,
  rclpy,
  rmw_dds_common,
  ros2node,
  ros2param,
  ros2pkg,
  ros2service,
  ros2topic,
  rosSystemPackages,
  rosapi_msgs,
  rosbridge_library,
  sensor_msgs,
  shape_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosapi-72cbe2e3a2f5a98e160d86e54667eceda6d47114 = substituteSource {
      src = fetchgit {
        name = "rosapi-72cbe2e3a2f5a98e160d86e54667eceda6d47114-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "72cbe2e3a2f5a98e160d86e54667eceda6d47114";
        hash = "sha256-5gDyqSXHMOUheu+7fjleKwHApIpOlhVvL9dpEujRBA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosapi";
  version = "1.3.2-3";
  src = sources.rosapi-72cbe2e3a2f5a98e160d86e54667eceda6d47114;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rcl_interfaces rclpy ros2node ros2param ros2pkg ros2service ros2topic rosapi_msgs rosbridge_library ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest geometry_msgs rmw_dds_common sensor_msgs shape_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides service calls for getting ros meta-information, like list of topics, services, params, etc.";
  };
}
