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
  version = "4.4.4-2";
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
        rev = "e411483813b9bdef8ad13f46c183eced71f0237d";
        hash = "sha256-62VkOrqxICuPzpjePQMz2QXGjxuXLV7gm1a1Q/3ooMM=";
      };
    };
  });
  meta = {
    description = "diagnostic_remote_logging";
  };
})
