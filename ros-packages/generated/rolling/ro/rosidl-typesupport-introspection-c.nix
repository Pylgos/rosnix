{
  ament-cmake,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_introspection_c";
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rosidl-runtime-c rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_introspection_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "523a7e2a0bb113ea3484e865a03080f02cb5f110";
        hash = "sha256-hV0Z26n/vAEVA3/7pNHFSlmygT3GkjWrpa6ShQJ2xAU=";
      };
    };
  });
  meta = {
    description = "Generate the message type support for dynamic message construction in C.";
  };
})
