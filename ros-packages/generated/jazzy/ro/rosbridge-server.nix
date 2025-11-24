{
  action-msgs,
  ament-cmake,
  ament-cmake-mypy,
  ament-cmake-python,
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
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."rosbridge_server";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclpy rosapi rosbridge-library rosbridge-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tornado" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclpy rosapi rosbridge-library rosbridge-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tornado" ]; };
  checkInputs = [ action-msgs ament-cmake-mypy example-interfaces launch launch-ros launch-testing-ament-cmake rcl-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-autobahn" "python3-twisted" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_server" = substituteSource {
      src = fetchgit {
        name = "rosbridge_server-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "0a4743f5c5d7c4f415f72b4aa2582f78d46d4287";
        hash = "sha256-o87jAzyiIZRTY0XvL84B3Vzh0NvSFoYQ4302d32UNoY=";
      };
    };
  });
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
