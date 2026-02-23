{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  can-msgs,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nobleo_socketcan_bridge";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."nobleo_socketcan_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros can-msgs diagnostic-msgs diagnostic-updater rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "linux-kernel-headers" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros can-msgs diagnostic-msgs diagnostic-updater rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "linux-kernel-headers" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nobleo_socketcan_bridge" = substituteSource {
      src = fetchgit {
        name = "nobleo_socketcan_bridge-source";
        url = "https://github.com/ros2-gbp/nobleo_socketcan_bridge-release.git";
        rev = "41ad8db9df421cc0e36287c4e6151215f31304d9";
        hash = "sha256-HCryHVM6pe2Yq6FAfDMT1ncvd82FxbNMwfgH61qNfvM=";
      };
    };
  });
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
})
