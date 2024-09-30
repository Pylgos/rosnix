{
  actionlib-msgs,
  ament-cmake,
  ament-cmake-pytest,
  buildRosPackage,
  builtin-interfaces,
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
  rosidl-default-generators,
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
let
  sources = mkSourceSet (sources: {
    "rosbridge_test_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_test_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "6b0fff188b9fd6ba9109f18426d8b055ea8332c7";
        hash = "sha256-ZgToC3Qm971d8Pn8MxepqwV+Qby1hi//qfK1idwJSIc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosbridge_test_msgs";
  version = "1.3.2-3";
  src = sources."rosbridge_test_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ actionlib-msgs ament-cmake-pytest builtin-interfaces diagnostic-msgs example-interfaces geometry-msgs nav-msgs sensor-msgs std-msgs std-srvs stereo-msgs tf2-msgs trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message and service definitions used in internal tests for rosbridge packages.";
  };
}
