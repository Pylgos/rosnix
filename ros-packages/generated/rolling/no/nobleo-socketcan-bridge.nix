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
  version = "1.0.3-1";
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
        rev = "c5ea50ababf34051e97744cd27365e77f90a8400";
        hash = "sha256-zotURPKFQk2zMgz0UNIoIPVv57nZHfRg5G3/JASTmNg=";
      };
    };
  });
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
})
