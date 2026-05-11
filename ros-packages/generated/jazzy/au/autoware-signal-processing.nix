{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_signal_processing";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_signal_processing";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_signal_processing" = substituteSource {
      src = fetchgit {
        name = "autoware_signal_processing-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "1a12e9d95b07d004344fbe69f799adb2e829ca3f";
        hash = "sha256-Xp6qxCFc3y3BAOX5gLKLll2mGtgemMY7475AWGd1TqQ=";
      };
    };
  });
  meta = {
    description = "The signal processing package";
  };
})
