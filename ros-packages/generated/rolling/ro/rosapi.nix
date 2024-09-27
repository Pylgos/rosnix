{
  ament_cmake_pytest,
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "rosapi" = substituteSource {
      src = fetchgit {
        name = "rosapi-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "f9dab22e6c80a763cb45b888ff0a491b285837f1";
        hash = "sha256-5gDyqSXHMOUheu+7fjleKwHApIpOlhVvL9dpEujRBA4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosapi";
  version = "1.3.2-2";
  src = sources."rosapi";
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
