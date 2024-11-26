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
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."dummy_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_sensors" = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "889f41619e9def6175f2a9281850c05867326aab";
        hash = "sha256-3UaemJ/hKSVf+gUdLXWjDIcmwQp3iNUt7MrpGq4qCRU=";
      };
    };
  });
  meta = {
    description = "dummy sensor nodes";
  };
})
