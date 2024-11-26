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
          rev = "a70796f31957d587c3ff3427bb55a1dfd95a5440";
          hash = "sha256-4GkgBnE5C7hUbJ0y5cLFQikMFGsFt4qwlGqCNYZ81EI=";
        };
      };
    });
  };
  meta = {
    description = "General purpose two-dimensional polygons. Formerly a part of nav_2d_msgs";
  };
})
