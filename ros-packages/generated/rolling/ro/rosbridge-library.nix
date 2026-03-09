{
  action-msgs,
  ament-cmake-mypy,
  ament-cmake-python,
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
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  rosbridge-test-msgs,
  rosidl-pycommon,
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
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rosbridge_library";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-interfaces rclpy rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-bson" "python3-cbor2" "python3-numpy" "python3-pil" "python3-ujson" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-interfaces rclpy rosidl-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-bson" "python3-cbor2" "python3-numpy" "python3-pil" "python3-ujson" ]; };
  checkInputs = [ action-msgs ament-cmake-mypy builtin-interfaces control-msgs diagnostic-msgs example-interfaces geometry-msgs nav-msgs rosbridge-test-msgs sensor-msgs std-msgs std-srvs stereo-msgs tf2-msgs trajectory-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_library" = substituteSource {
      src = fetchgit {
        name = "rosbridge_library-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "ad7bed5afc74d4235278eecb3843c07c80618c57";
        hash = "sha256-o2+Bo9rM1tDzqdKDp7sdcklS3JOSBVnErNP1jptReRE=";
      };
    };
  });
  meta = {
    description = "\nThe core rosbridge package, responsible for interpreting JSON and performing the appropriate\nROS action, like subscribe, publish, call service, and interact with params.\n  ";
  };
})
