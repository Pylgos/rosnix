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
  version = "0.7.1-2";
  src = finalAttrs.passthru.sources."find_object_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge geometry-msgs image-transport message-filters rclcpp rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "find_object_2d" = substituteSource {
      src = fetchgit {
        name = "find_object_2d-source";
        url = "https://github.com/ros2-gbp/find_object_2d-release.git";
        rev = "553813fa3500a31f95f437e0767c7a30b927630e";
        hash = "sha256-njkQr+O+9huFcwwGGOLQgumrN8K4RuGpTCjeMdVtuhA=";
      };
    };
  });
  meta = {
    description = "The find_object_2d package";
  };
})
