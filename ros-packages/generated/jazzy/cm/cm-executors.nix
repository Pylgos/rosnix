{
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rclcpp,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cm_executors";
  version = "0.9.1-1";
  src = finalAttrs.passthru.sources."cm_executors";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rmw rmw-implementation-cmake rosidl-default-generators test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "cm_executors" = substituteSource {
      src = fetchgit {
        name = "cm_executors-source";
        url = "https://github.com/ros2-gbp/cm_executors-release.git";
        rev = "088202cc9bc33582f652b041c52de625ac06d582";
        hash = "sha256-T/hqbrkuRAeQm7R3tz7DqqLX6kkZ2L9KbuaLeHtkcJM=";
      };
    };
  });
  meta = {
    description = "Cellumation executor package .";
  };
})
