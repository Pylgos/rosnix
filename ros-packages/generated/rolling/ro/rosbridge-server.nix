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
  version = "4.1.0-1";
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
        rev = "2eedb8c4eed0c0967638fe077c2e98b95f9914fb";
        hash = "sha256-LxsCCu2fgqV/J5WYieRlnJ59AARxQoes9U/lxhet6JI=";
      };
    };
  });
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
