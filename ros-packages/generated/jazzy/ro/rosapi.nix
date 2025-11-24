{
  ament-cmake,
  ament-cmake-mypy,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rmw-dds-common,
  ros2action,
  ros2interface,
  ros2node,
  ros2service,
  ros2topic,
  rosSystemPackages,
  rosapi-msgs,
  rosbridge-library,
  rosidl-adapter,
  rosidl-runtime-py,
  sensor-msgs,
  shape-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosapi";
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."rosapi";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl-interfaces rclpy ros2action ros2interface ros2node ros2service ros2topic rosapi-msgs rosbridge-library rosidl-adapter rosidl-runtime-py ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rclpy ros2action ros2interface ros2node ros2service ros2topic rosapi-msgs rosbridge-library rosidl-adapter rosidl-runtime-py ];
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest geometry-msgs rmw-dds-common sensor-msgs shape-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi" = substituteSource {
      src = fetchgit {
        name = "rosapi-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "707a80f6c27dd88880ae49e7f73c9d9012254ac8";
        hash = "sha256-t1ZkcbomC69Q16pQxZpf4E3XHLSgKYmm0dQu+wfR97c=";
      };
    };
  });
  meta = {
    description = "\nProvides services for getting various ROS meta-information, including ROS topic, services, interfaces or\naction servers and managing ROS parameters.\n  ";
  };
})
