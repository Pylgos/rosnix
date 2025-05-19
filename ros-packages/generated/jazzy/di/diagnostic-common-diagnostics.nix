{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_common_diagnostics";
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."diagnostic_common_diagnostics";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ diagnostic-updater rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lm-sensors" "python3-ntplib" "python3-psutil" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-updater rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lm-sensors" "python3-ntplib" "python3-psutil" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-cmake-xmllint ament-lint-auto launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_common_diagnostics" = substituteSource {
      src = fetchgit {
        name = "diagnostic_common_diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "1308b28f51aea861510ea12ed6b80fe7fba21a51";
        hash = "sha256-tv8tVAlQk1/1/8QgM1fGCYYA3KQ3Q/XpMHA/S+vHs4k=";
      };
    };
  });
  meta = {
    description = "diagnostic_common_diagnostics";
  };
})
