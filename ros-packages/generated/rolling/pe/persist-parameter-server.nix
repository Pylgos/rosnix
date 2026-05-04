{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "persist_parameter_server";
  version = "1.0.5-2";
  src = finalAttrs.passthru.sources."persist_parameter_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake std-msgs std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libboost-filesystem-dev" "libboost-program-options-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake std-msgs std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libboost-filesystem-dev" "libboost-program-options-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch ];
  passthru.sources = mkSourceSet (sources: {
    "persist_parameter_server" = substituteSource {
      src = fetchgit {
        name = "persist_parameter_server-source";
        url = "https://github.com/ros2-gbp/persist_parameter_server-release.git";
        rev = "10811471f91025c6c9b73254ec0b5bd63b1abe92";
        hash = "sha256-y5alTKmTzWAIEuu5BjDCdW+Qmi9/DB1IlugCzA7Z+LQ=";
      };
    };
  });
  meta = {
    description = "\n    ros2 parameter server that other nodes can write/read parameters including persistent parameters.\n  ";
  };
})
