{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ffmpeg_encoder_decoder" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_encoder_decoder-source";
        url = "https://github.com/ros2-gbp/ffmpeg_encoder_decoder-release.git";
        rev = "d0a55a82d0c309e26dcaef7875ed6407df214807";
        hash = "sha256-r++5zahdLLkPS63l7DhrxtFSCYkRWcbI+FPUFA4+kjA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "ffmpeg_encoder_decoder";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."ffmpeg_encoder_decoder";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavdevice-dev" "libopencv-imgproc-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS2 convenience wrapper around ffmpeg for encoding/decoding";
  };
})
