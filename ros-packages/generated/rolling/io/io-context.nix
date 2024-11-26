{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  asio-cmake-module,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  udp-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "io_context";
  version = "1.2.0-3";
  src = finalAttrs.passthru.sources."io_context";
  nativeBuildInputs = [ ament-cmake-auto asio-cmake-module ];
  propagatedBuildInputs = [ rclcpp std-msgs udp-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "io_context" = substituteSource {
        src = fetchgit {
          name = "io_context-source";
          url = "https://github.com/ros2-gbp/transport_drivers-release.git";
          rev = "c643b23ddac83542b700173d20e62fde3143ef7b";
          hash = "sha256-RINF/bmOZEexBa8eMAkn2J1r1NOrze8SI3fx1t/ywak=";
        };
      };
    });
  };
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications";
  };
})
