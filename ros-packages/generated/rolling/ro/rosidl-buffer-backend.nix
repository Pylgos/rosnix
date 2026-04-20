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
  version = "5.1.4-2";
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
        rev = "067bfdf85accc5ea9fb9fdd4cd461cf53f3a9374";
        hash = "sha256-jd0GGnuGrYX6KQusxyi39Ppp6sOrDaYfDJ2KOxEjE70=";
      };
    };
  });
  meta = {
    description = "Buffer backend interface for ROS2 buffer types";
  };
})
