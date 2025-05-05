{
  ament-cmake,
  ament-cmake-mypy,
  ament-cmake-ros,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosapi,
  rosbridge-library,
  rosbridge-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_server";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosbridge_server";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rosapi rosbridge-library rosbridge-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tornado" "python3-twisted" ]; };
  checkInputs = [ ament-cmake-mypy example-interfaces launch launch-ros launch-testing launch-testing-ament-cmake launch-testing-ros std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-autobahn" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_server" = substituteSource {
      src = fetchgit {
        name = "rosbridge_server-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "f6145c7a840624a731f75bdb330bc6fb26b75a39";
        hash = "sha256-7s9FTHdRZeKzpY4G8xvbN6WeHIN11SY06BbFQB4iAwE=";
      };
    };
  });
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
