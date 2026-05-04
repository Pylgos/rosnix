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
  version = "0.37.8-2";
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
        rev = "38ad73d5d6fddea8feb5fed180ef5632a5240c9b";
        hash = "sha256-AocVWptA354vro4P7OVO/ZRfaWQxRJtyBVKJ3B5kv5I=";
      };
    };
  });
  meta = {
    description = "Demonstrations of intra process communication.";
  };
})
