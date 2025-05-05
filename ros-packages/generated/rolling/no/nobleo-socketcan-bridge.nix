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
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."nobleo_socketcan_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros can-msgs diagnostic-msgs diagnostic-updater rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros can-msgs diagnostic-msgs diagnostic-updater rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nobleo_socketcan_bridge" = substituteSource {
      src = fetchgit {
        name = "nobleo_socketcan_bridge-source";
        url = "https://github.com/ros2-gbp/nobleo_socketcan_bridge-release.git";
        rev = "6c2340a28dfb34356f2233095131bfd05637b645";
        hash = "sha256-EMIPKUZ5KhH7eqA3+Rcs0ztrFcgg2XDbjbobQmTvizQ=";
      };
    };
  });
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
})
