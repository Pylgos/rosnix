{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-python,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_example_object_detection";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."leo_example_object_detection";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ cv-bridge rcl-interfaces rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-opencv" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ cv-bridge rcl-interfaces rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_example_object_detection" = substituteSource {
      src = fetchgit {
        name = "leo_example_object_detection-source";
        url = "https://github.com/ros2-gbp/leo_examples-ros2-release.git";
        rev = "5b8102f24feb02757971585f8adfc0ec36fb2f8c";
        hash = "sha256-k+rHuKLJMLRlPdi9v5Ri61vwODrzXOghViaX0RAI4kA=";
      };
    };
  });
  meta = {
    description = "\n    Object Detection Example for Leo Rover.\n  ";
  };
})
