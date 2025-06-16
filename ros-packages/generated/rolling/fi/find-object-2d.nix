{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "find_object_2d";
  version = "0.7.4-1";
  src = finalAttrs.passthru.sources."find_object_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport message-filters rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport message-filters rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "find_object_2d" = substituteSource {
      src = fetchgit {
        name = "find_object_2d-source";
        url = "https://github.com/ros2-gbp/find_object_2d-release.git";
        rev = "482832215094bbbd6c90f7066a06d9351361d1b1";
        hash = "sha256-qv3K70jLUJKhDx/gDflPm3dXxT0HZ1F1X0fP81BWxho=";
      };
    };
  });
  meta = {
    description = "The find_object_2d package";
  };
})
