{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dummy_sensors";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."dummy_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dummy_sensors" = substituteSource {
        src = fetchgit {
          name = "dummy_sensors-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "b509f409eed730bb594ece2058b3e19e213391b4";
          hash = "sha256-C/IMzSeUpbsbmKih4TbsZbkIlfvAzF0KG5WB0uoxskA=";
        };
      };
    });
  };
  meta = {
    description = "dummy sensor nodes";
  };
})
