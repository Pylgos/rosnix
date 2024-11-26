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
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rclc_lifecycle" = substituteSource {
        src = fetchgit {
          name = "rclc_lifecycle-source";
          url = "https://github.com/ros2-gbp/rclc-release.git";
          rev = "5722130c18a6922dc9c140c399b7b36308aca42f";
          hash = "sha256-yQ696kvgMGw2VA7lPuhKqJYDjWyK2KvFnLEMekF7/AI=";
        };
      };
    });
  };
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
})
