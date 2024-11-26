{
  action-msgs,
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
  diagnostic-msgs,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  rosbridge-test-msgs,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  stereo-msgs,
  substituteSource,
  tf2-msgs,
  trajectory-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_library";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosbridge_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ rclpy rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-bson" "python3-pil" ]; };
  checkInputs = [ action-msgs ament-cmake-pytest builtin-interfaces control-msgs diagnostic-msgs example-interfaces geometry-msgs nav-msgs rosbridge-test-msgs sensor-msgs std-msgs std-srvs stereo-msgs tf2-msgs trajectory-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_library" = substituteSource {
      src = fetchgit {
        name = "rosbridge_library-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "3ae4dea75a6fab27ea77cfaf34e3a67f34912e4a";
        hash = "sha256-+pOcP2d8XFjvRpJbVfA1m9s80GnHHqz/rlEs55oQoPM=";
      };
    };
  });
  meta = {
    description = "The core rosbridge package, responsible for interpreting JSON andperforming the appropriate ROS action, like subscribe, publish, call service, and interact with params.";
  };
})
