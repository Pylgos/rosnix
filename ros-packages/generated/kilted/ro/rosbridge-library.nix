{
  action-msgs,
  ament-cmake,
  ament-cmake-mypy,
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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rosbridge_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclpy rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-bson" "python3-pil" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ rclpy rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-bson" "python3-pil" ]; };
  checkInputs = [ action-msgs ament-cmake-mypy ament-cmake-pytest builtin-interfaces control-msgs diagnostic-msgs example-interfaces geometry-msgs nav-msgs rosbridge-test-msgs sensor-msgs std-msgs std-srvs stereo-msgs tf2-msgs trajectory-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_library" = substituteSource {
      src = fetchgit {
        name = "rosbridge_library-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "0bc9cec2eac3e218c7f0693847f064e79566a65f";
        hash = "sha256-9fwJ6r3waJYfOg80QkpPxEdohHvTx5WgM7AFI4utk6Y=";
      };
    };
  });
  meta = {
    description = "\n    The core rosbridge package, responsible for interpreting JSON andperforming\n    the appropriate ROS action, like subscribe, publish, call service, and\n    interact with params.\n  ";
  };
})
