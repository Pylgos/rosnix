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
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."flex_sync";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-clang-format rclcpp rclcpp-components rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-clang-format rclcpp rclcpp-components rosidl-default-runtime ];
  checkInputs = [ ament-clang-format ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "flex_sync" = substituteSource {
      src = fetchgit {
        name = "flex_sync-source";
        url = "https://github.com/ros2-gbp/flex_sync-release.git";
        rev = "43022ff282e84dcbef6d30b08f4b1eadde135620";
        hash = "sha256-GQfvPJLxgnCOYtZefMA54E/Gy+1Nhcv+kISbR0BsRR0=";
      };
    };
  });
  meta = {
    description = "ros2 package for syncing variable number of topics";
  };
})
