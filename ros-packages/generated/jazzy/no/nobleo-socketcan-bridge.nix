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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."nobleo_socketcan_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ can-msgs diagnostic-msgs diagnostic-updater rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nobleo_socketcan_bridge" = substituteSource {
      src = fetchgit {
        name = "nobleo_socketcan_bridge-source";
        url = "https://github.com/ros2-gbp/nobleo_socketcan_bridge-release.git";
        rev = "63a7c0035e6ec4fb1490e72e8aaf44d55edcc0de";
        hash = "sha256-jXQbHzjDttsIOLI8ifcNmigs17bxUUHMXauKVJv52XA=";
      };
    };
  });
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
})
