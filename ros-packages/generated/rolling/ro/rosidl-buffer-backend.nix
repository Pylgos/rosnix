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
  version = "5.3.0-1";
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
        rev = "cce747aa110e39052f81bb7c2c36068974a12781";
        hash = "sha256-wlswA0T1Y1rvTS0p309MhAUDWIegG92YxWzNXBhlRiU=";
      };
    };
  });
  meta = {
    description = "Buffer backend interface for ROS2 buffer types";
  };
})
