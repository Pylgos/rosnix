{
  action-msgs,
  ament-cmake-mypy,
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  rosapi,
  rosbridge-library,
  rosbridge-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_server";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."rosbridge_server";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclpy rosapi rosbridge-library rosbridge-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tornado" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ rclpy rosapi rosbridge-library rosbridge-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tornado" ]; };
  checkInputs = [ action-msgs ament-cmake-mypy example-interfaces launch launch-ros launch-testing-ament-cmake rcl-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-autobahn" "python3-twisted" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_server" = substituteSource {
      src = fetchgit {
        name = "rosbridge_server-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "c5e9d25cc9829512b88ac45dcee1152b5fcadaa5";
        hash = "sha256-u5m+81VGfE3gOrEvxZQwoIQqWqglXmIZVQZzQYOY/ms=";
      };
    };
  });
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
