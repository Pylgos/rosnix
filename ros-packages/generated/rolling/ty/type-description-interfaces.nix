{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "type_description_interfaces";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."type_description_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ rosidl-core-runtime service-msgs ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "type_description_interfaces" = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "91d5401e8bfd0976f02beb970e6db09ba922bebc";
        hash = "sha256-/sKxgVN1VNCC20zdDo6CuEEn/ySpSEQv4u5NY85VZvk=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
})
