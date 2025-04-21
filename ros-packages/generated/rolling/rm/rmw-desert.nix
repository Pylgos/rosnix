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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."rmw_desert";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rcpputils rosidl-cmake ];
  propagatedBuildInputs = [ rcutils rmw rmw-dds-common rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_desert" = substituteSource {
      src = fetchgit {
        name = "rmw_desert-source";
        url = "https://github.com/ros2-gbp/rmw_desert-release.git";
        rev = "5ab2fb5fb0ea0fe54a0c85d3fe1fd6a7b667c5dc";
        hash = "sha256-dAQM4soi9dSHqgZy/OdT8z8llKmGFZ03QswTy/LG5jQ=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using the DESERT protocol stack for underwater communications.";
  };
})
