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
  version = "1.0.4-2";
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
        rev = "fbb3e346531a833011ecef4426dd8858d487f0ab";
        hash = "sha256-Lsf0kJ7qmAl58CKi3bMrpxaAFIgiaYEliVoQRjoT0oc=";
      };
    };
  });
  meta = {
    description = "\n    ros2 parameter server that other nodes can write/read parameters including persistent parameters.\n  ";
  };
})
