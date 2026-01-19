{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  apriltag-ros,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf-transformations,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "hitch_estimation_apriltag_array";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."hitch_estimation_apriltag_array";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ apriltag-ros geometry-msgs rclpy sensor-msgs tf2-ros tf-transformations ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ apriltag-ros geometry-msgs rclpy sensor-msgs tf2-ros tf-transformations ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hitch_estimation_apriltag_array" = substituteSource {
      src = fetchgit {
        name = "hitch_estimation_apriltag_array-source";
        url = "https://github.com/li9i/hitch-estimation-apriltag-array-release.git";
        rev = "0561f222794b24b80c1a3ecfb8cea86ba0f62b94";
        hash = "sha256-D4TMH/KnijiW97JeTZ+STXWCfaNw46AvTI6aheJELiU=";
      };
    };
  });
  meta = {
    description = "\n    A package that estimates the hitch joint state between a robot and a\n    trailer by optical recognition of an array of April tags mounted at the\n    front of the trailer by the rear camera of the robot\n  ";
  };
})
