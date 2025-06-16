{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  laser-geometry,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lms1xx";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."lms1xx";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs laser-geometry rclcpp sensor-msgs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs laser-geometry rclcpp sensor-msgs tf2 tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lms1xx" = substituteSource {
      src = fetchgit {
        name = "lms1xx-source";
        url = "https://github.com/clearpath-gbp/LMS1xx-release.git";
        rev = "1f25b20d8ee155cef5b97e84e644264385dca91f";
        hash = "sha256-T8onkmo0MplpVRQCuUnvzjMa0pRVzlDy7Nsu8nHsuM4=";
      };
    };
  });
  meta = {
    description = "The lms1xx package contains a basic ROS 2 driver for the SICK LMS1xx line of LIDARs.";
  };
})
