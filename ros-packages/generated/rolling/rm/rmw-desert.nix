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
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."rmw_desert";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cmake ];
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-dds-common rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_desert" = substituteSource {
      src = fetchgit {
        name = "rmw_desert-source";
        url = "https://github.com/ros2-gbp/rmw_desert-release.git";
        rev = "a4b9bbd2f7fd0413fd8c646b174e2c8838f1649a";
        hash = "sha256-JBr+UjfRXYg9YXr02OirAx/AU0PgPEgzfdZxNpwoCE8=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using the DESERT protocol stack for underwater communications.";
  };
})
