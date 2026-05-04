{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_buffer_backend";
  version = "5.2.0-2";
  src = finalAttrs.passthru.sources."rosidl_buffer_backend";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer_backend" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer_backend-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "dcea597cdb58d64af8df7154712f81e124050798";
        hash = "sha256-7r8BBNX76ukN3dfdGa3qnb4uEt0MUA74N6K932m0Koo=";
      };
    };
  });
  meta = {
    description = "Buffer backend interface for ROS2 buffer types";
  };
})
