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
  version = "3.0.2-1";
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
        rev = "5409f698f3a1a7bbd91e18a382e490512e04d890";
        hash = "sha256-2nNXHeQ8JqulwyazmdcMagTWeAWSirg1YWg5MJn+RTA=";
      };
    };
  });
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
