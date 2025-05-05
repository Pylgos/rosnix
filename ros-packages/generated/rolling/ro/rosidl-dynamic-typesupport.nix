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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidl_dynamic_typesupport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  depsTargetTargetPropagated = [ rcutils rosidl-runtime-c ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_dynamic_typesupport" = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "5a005d93f243327ce035f647ae6eb68b866436c6";
        hash = "sha256-J6IbX67yqZr55Td8DxM/oPQGNLMkRHvms4wE5IhwHh0=";
      };
    };
  });
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
})
