{
  ament-cmake,
  ament-cmake-ros-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_dynamic_typesupport";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "aa82e15b71b74d3073c6c2c11d3589dcd259fbd1";
        hash = "sha256-z3lq0viK1kPEX9dBA6lZXclo9tTtrE48/9O9uP8WFTM=";
      };
    };
  });
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
