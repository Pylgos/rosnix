{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fastrtps_cmake_module";
  version = "3.6.1-1";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "db24729c8071186a27a6a0f1fe3de4ef3864bf50";
        hash = "sha256-aDCbgTpuUcR0a3kfAhknt2WKC/GHD3OyCF8GVZYq/2Q=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
