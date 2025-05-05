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
  version = "1.1.1-4";
  src = finalAttrs.passthru.sources."urg_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-updater laser-proc rclcpp-components sensor-msgs std-srvs urdf urg-c urg-node-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urg_node" = substituteSource {
      src = fetchgit {
        name = "urg_node-source";
        url = "https://github.com/ros2-gbp/urg_node-release.git";
        rev = "78cb9f69fb5e467d23badd16e04b0f751e1661a5";
        hash = "sha256-hz6upepfbgI1ToUr7XupzHvWBA7oKZk4QZTKCZwbMRI=";
      };
    };
  });
  meta = {
    description = "urg_node";
  };
})
