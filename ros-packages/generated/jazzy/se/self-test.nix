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
  version = "4.2.2-1";
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
        rev = "dacaee6e2647eee39b86da51bbe5c6b7d5e6932c";
        hash = "sha256-pHw5Ma+9NBeNx2V7pABbjZDN9O/ESdgJIT99MVBM/iw=";
      };
    };
  });
  meta = {
    description = "self_test";
  };
})
