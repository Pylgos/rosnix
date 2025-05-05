{
  ament-cmake,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_desert";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmw_desert";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rcpputils rosidl-cmake ];
  propagatedBuildInputs = [ rcutils rmw rmw-dds-common rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_desert" = substituteSource {
      src = fetchgit {
        name = "rmw_desert-source";
        url = "https://github.com/ros2-gbp/rmw_desert-release.git";
        rev = "542002178a7cfb84289e680f465af0f80d49acbb";
        hash = "sha256-IunGNLKGhjAbtj5LY24nJTVnsKenobIJpTYsOvMa/ZQ=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using the DESERT protocol stack for underwater communications.";
  };
})
