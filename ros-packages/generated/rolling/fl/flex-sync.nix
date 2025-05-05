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
        rev = "c9912ffa6d31b5704c13c376b92c0c201fa7ad30";
        hash = "sha256-DRj8hRb5f02ZdXinTOUCOnVQRMHJS/Es67wgVFdZmUs=";
      };
    };
  });
  meta = {
    description = "ros2 package for syncing variable number of topics";
  };
})
