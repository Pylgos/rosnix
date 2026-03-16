{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl-lifecycle,
  rclc,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_lifecycle";
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."rclc_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "6106fb1d1aefca15b70ef5c1de86dc40a12fe907";
        hash = "sha256-OE99t+qn+boSvQFmUy5OkIxooyxHvSttZOYCoc94oYY=";
      };
    };
  });
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
})
