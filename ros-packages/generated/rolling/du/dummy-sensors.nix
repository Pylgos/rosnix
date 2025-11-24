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
  version = "0.37.4-1";
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
        rev = "0114abb6b87991397f78c96ba0ee7fce2fac4ea3";
        hash = "sha256-rbG2WLcpyisItdRYm9QDq1zH/nRrd/wYEButG/TC6Rc=";
      };
    };
  });
  meta = {
    description = "\n    dummy sensor nodes\n  ";
  };
})
