{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  laser-proc,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  std-srvs,
  substituteSource,
  urdf,
  urg-c,
  urg-node-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urg_node";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."urg_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-updater laser-proc rclcpp rclcpp-components rosidl-default-generators sensor-msgs std-srvs urdf urg-c urg-node-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-updater laser-proc rclcpp rclcpp-components rosidl-default-generators sensor-msgs std-srvs urdf urg-c urg-node-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urg_node" = substituteSource {
      src = fetchgit {
        name = "urg_node-source";
        url = "https://github.com/ros2-gbp/urg_node-release.git";
        rev = "add885f7080d4284db8a11edbfd5a7fa3f6cb911";
        hash = "sha256-CSk67xMhCE8x4dBhR1R348gAyhcKmCHNF0NkL7nQKrU=";
      };
    };
  });
  meta = {
    description = "urg_node";
  };
})
