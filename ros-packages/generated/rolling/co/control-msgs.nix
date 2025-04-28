{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "control_msgs";
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."control_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "control_msgs" = substituteSource {
      src = fetchgit {
        name = "control_msgs-source";
        url = "https://github.com/ros2-gbp/control_msgs-release.git";
        rev = "e8a1499df9382e1cc3b3b4a9b25e26ef4e4021cc";
        hash = "sha256-51+4zL9H1K0wqXSxzHa2aeECLjABmqiMIljKXaLYaS8=";
      };
    };
  });
  meta = {
    description = "control_msgs contains base messages and actions useful for controlling robots. It provides representations for controller setpoints and joint and cartesian trajectories.";
  };
})
