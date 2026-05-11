{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rmw-implementation-cmake,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "intra_process_demo";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."intra_process_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-core" "libopencv-dev" "libopencv-highgui" "libopencv-imgproc" "libopencv-videoio" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-core" "libopencv-dev" "libopencv-highgui" "libopencv-imgproc" "libopencv-videoio" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "intra_process_demo" = substituteSource {
      src = fetchgit {
        name = "intra_process_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "643124c97c74327d15cdf08d31f08fc0c04f840a";
        hash = "sha256-n5Et6x6zX9gpT6/jiwjMITezSJi0prhSsB2SwAPYta0=";
      };
    };
  });
  meta = {
    description = "Demonstrations of intra process communication.";
  };
})
