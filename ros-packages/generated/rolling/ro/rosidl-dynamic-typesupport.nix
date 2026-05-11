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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcutils rosidl-runtime-c ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "b00b728c65f36f3c4771f2fafbf6b08e6604d5ea";
        hash = "sha256-FC0jSZ246QHAqcauL1lCw8fMJut/QSc6gSCLdGer4Kg=";
      };
    };
  });
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
