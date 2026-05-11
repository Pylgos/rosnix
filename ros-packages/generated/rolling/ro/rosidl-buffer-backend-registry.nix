{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rmw,
  rosSystemPackages,
  rosidl-buffer,
  rosidl-buffer-backend,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_buffer_backend_registry";
  version = "5.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_buffer_backend_registry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rmw rosidl-buffer-backend rosidl-runtime-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rmw rosidl-buffer-backend rosidl-runtime-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-buffer ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer_backend_registry" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer_backend_registry-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "0e9745a422539fd4322ab9b0de76222ccf79ffb1";
        hash = "sha256-3GdDWgBSUW8kFpULxaRbiZG24KW/P9tBh/3Wx8tJZTI=";
      };
    };
  });
  meta = {
    description = "Backend discovery and plugin loading for ROS2 buffer types";
  };
})
