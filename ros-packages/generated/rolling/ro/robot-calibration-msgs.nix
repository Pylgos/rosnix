{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_calibration_msgs";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."robot_calibration_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "robot_calibration_msgs" = substituteSource {
      src = fetchgit {
        name = "robot_calibration_msgs-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "d71d52ea81dc53cc555919a7cb8a4ddb639af6a7";
        hash = "sha256-9+3xY7VTK0DUi2aU2RmmsP7CUvwaJH1astgQ78uUXtU=";
      };
    };
  });
  meta = {
    description = "Messages for calibrating a robot";
  };
})
