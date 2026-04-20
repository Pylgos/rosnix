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
  version = "0.33.10-1";
  src = finalAttrs.passthru.sources."dummy_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_sensors" = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "44664f7f9065aee7166d0dd4a4c6cdce316aa118";
        hash = "sha256-L3cFggH0dt9GKRprSbh9AN8Kg8iyHRg7zX9rJd25DKQ=";
      };
    };
  });
  meta = {
    description = "\n    dummy sensor nodes\n  ";
  };
})
