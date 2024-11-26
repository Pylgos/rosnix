{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_msgs";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."polygon_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "polygon_msgs" = substituteSource {
        src = fetchgit {
          name = "polygon_msgs-source";
          url = "https://github.com/ros2-gbp/polygon_ros-release.git";
          rev = "98167ebd85ee2e26652af1bc3fc8b3e7f6cdf427";
          hash = "sha256-4GkgBnE5C7hUbJ0y5cLFQikMFGsFt4qwlGqCNYZ81EI=";
        };
      };
    });
  };
  meta = {
    description = "General purpose two-dimensional polygons. Formerly a part of nav_2d_msgs";
  };
})
