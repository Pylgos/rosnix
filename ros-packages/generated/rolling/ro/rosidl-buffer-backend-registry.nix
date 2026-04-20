{
  ament-cmake,
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
  version = "5.1.4-2";
  src = finalAttrs.passthru.sources."rosidl_buffer_backend_registry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rmw rosidl-buffer-backend rosidl-runtime-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rmw rosidl-buffer-backend rosidl-runtime-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common rosidl-buffer ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer_backend_registry" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer_backend_registry-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "afe4a564166260cd19479d09b6300461d553d683";
        hash = "sha256-+8cQkzuwgCYgznk3iP1bK9UMtWKZb8jJw/xvOIz7Xrk=";
      };
    };
  });
  meta = {
    description = "Backend discovery and plugin loading for ROS2 buffer types";
  };
})
