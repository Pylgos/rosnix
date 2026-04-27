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
  version = "5.2.0-1";
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
        rev = "71e377e308a39ccca487a63cf92ff07527e8802a";
        hash = "sha256-eVgvHCFz9af1eiYmWhzXHO2K0AFWPdJRPGV1j4YUTtA=";
      };
    };
  });
  meta = {
    description = "Backend discovery and plugin loading for ROS2 buffer types";
  };
})
