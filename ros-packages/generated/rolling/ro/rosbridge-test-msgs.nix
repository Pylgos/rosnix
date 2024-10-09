{
  action-msgs,
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
        rev = "e9c6ddd6adcdd60dce7d378e3f0906e040f988cf";
        hash = "sha256-oy5Ym9Cqjxvje6sN1vCG18Bo3eYlZM8DyZuJKqLXfY0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "rosbridge_test_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosbridge_test_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ action-msgs ament-cmake-pytest builtin-interfaces diagnostic-msgs example-interfaces geometry-msgs nav-msgs sensor-msgs std-msgs std-srvs stereo-msgs tf2-msgs trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Message and service definitions used in internal tests for rosbridge packages.";
  };
})
