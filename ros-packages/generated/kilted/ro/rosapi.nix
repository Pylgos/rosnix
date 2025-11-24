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
  version = "3.0.2-1";
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
        rev = "a43adf71a32296c1cdf7acf9f32614b70e0259bd";
        hash = "sha256-ehPJTGhEjp0WNKjFPw7rlAlm2bwwXFqH+1+R76MjZf0=";
      };
    };
  });
  meta = {
    description = "\nProvides services for getting various ROS meta-information, including ROS topic, services, interfaces or\naction servers and managing ROS parameters.\n  ";
  };
})
