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
let
  sources = mkSourceSet (sources: {
    "image_proc" = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "d2538353f200a9917f83cf075f6413b31e63ccf7";
        hash = "sha256-Gq+ue2QV1njxDju8Mnp9RXs7C5o2q8SWFfYawRwfmtg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "image_proc";
  version = "6.0.5-1";
  src = finalAttrs.passthru.sources."image_proc";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport rclcpp rclcpp-components rcutils sensor-msgs tf2 tf2-geometry-msgs tracetools-image-pipeline ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Single image rectification and color processing.";
  };
})
