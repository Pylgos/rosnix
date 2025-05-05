{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_remote_logging";
  version = "4.2.3-1";
  src = finalAttrs.passthru.sources."diagnostic_remote_logging";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_remote_logging" = substituteSource {
      src = fetchgit {
        name = "diagnostic_remote_logging-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "99833d0847e69ce9fc722ebb44c3c870655fb656";
        hash = "sha256-eXuoNgGKqjzPJGxr7twBtuSRTBNfrdiSlxzLjW1avP8=";
      };
    };
  });
  meta = {
    description = "diagnostic_remote_logging";
  };
})
