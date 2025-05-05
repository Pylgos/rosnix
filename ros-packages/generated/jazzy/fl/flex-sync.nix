{
  ament-clang-format,
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flex_sync";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."flex_sync";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ ament-cmake-clang-format rclcpp-components rosidl-default-runtime ];
  checkInputs = [ ament-clang-format ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "flex_sync" = substituteSource {
      src = fetchgit {
        name = "flex_sync-source";
        url = "https://github.com/ros2-gbp/flex_sync-release.git";
        rev = "96e1e5af12f61327a7453551c34e6ecc2d6fb750";
        hash = "sha256-DRj8hRb5f02ZdXinTOUCOnVQRMHJS/Es67wgVFdZmUs=";
      };
    };
  });
  meta = {
    description = "ros2 package for syncing variable number of topics";
  };
})
