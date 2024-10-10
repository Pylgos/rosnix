{
  ament-cmake,
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
let
  sources = mkSourceSet (sources: {
    "rosbridge_server" = substituteSource {
      src = fetchgit {
        name = "rosbridge_server-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "10dddddeab9244d5a874859ff9937d6f0074e92e";
        hash = "sha256-sjN0O5RAilkta8bynRYxr1j78/KV8aa/2b5yXXZZ2tk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_server";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosbridge_server";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy rosapi rosbridge-library rosbridge-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tornado" "python3-twisted" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ example-interfaces launch launch-ros launch-testing launch-testing-ament-cmake launch-testing-ros std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-autobahn" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
})
