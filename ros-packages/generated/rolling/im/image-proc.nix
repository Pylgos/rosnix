{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-geometry,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tracetools-image-pipeline,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_proc";
  version = "6.0.10-1";
  src = finalAttrs.passthru.sources."image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tf2 tf2-geometry-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tf2 tf2-geometry-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_proc" = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "49c19ea53756ff0d83283523dbddd9c649208d9e";
        hash = "sha256-DpTWTjSBoQvE8gFSZV8q5tQsZJD8jw8Aiy3SqpwY0Ds=";
      };
    };
  });
  meta = {
    description = "Single image rectification and color processing.";
  };
})
