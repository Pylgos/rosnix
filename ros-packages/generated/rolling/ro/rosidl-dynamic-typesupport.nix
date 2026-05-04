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
  version = "0.4.1-2";
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
        rev = "c7ca340e0eb4d681b41b572ab5c27d2c061f079c";
        hash = "sha256-oZyMCDTLDVaJEc31As4bU8p4Lg3NhKigSLPpNoqR8zo=";
      };
    };
  });
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
