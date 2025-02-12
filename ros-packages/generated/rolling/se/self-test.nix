{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "self_test";
  version = "4.4.2-1";
  src = finalAttrs.passthru.sources."self_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "self_test" = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "b8e10fc8b358a9af8f85433fdb2ace07e7a1d504";
        hash = "sha256-6ApLXg8lnWefaxfMJHd1U/H+XB6zrSuscEU+Ns/SaFE=";
      };
    };
  });
  meta = {
    description = "self_test";
  };
})
