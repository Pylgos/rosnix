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
  version = "5.0.6-1";
  src = finalAttrs.passthru.sources."image_proc";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tf2 tf2-geometry-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_proc" = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "74c340e608e4b6d889745e003f6bd42863a12892";
        hash = "sha256-raRlHUIMWGD5SaLU+W/I1fGkykRtuW5kg31SIwT7ehs=";
      };
    };
  });
  meta = {
    description = "Single image rectification and color processing.";
  };
})
