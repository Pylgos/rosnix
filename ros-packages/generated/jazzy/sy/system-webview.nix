{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbridge-server,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "system_webview";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."system_webview";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rosbridge-server ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp rosbridge-server ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "system_webview" = substituteSource {
      src = fetchgit {
        name = "system_webview-source";
        url = "https://github.com/ros2-gbp/system_webview-release.git";
        rev = "9e0cf2c6c3e1c33eb5db06796a081d101dd528d2";
        hash = "sha256-LtbhwfJ0yaniL6rX0ncoCzQ8XADTZFDGoPNOuzZwlow=";
      };
    };
  });
  meta = {
    description = "Real-time web-based system webview for ROS 2 — CPU, memory, swap, load average, and /rosout log viewer";
  };
})
