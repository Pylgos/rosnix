{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_site_map_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_site_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_site_map_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_site_map_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "eb5119931d060a6086b286de425bdc47a958a4d4";
        hash = "sha256-D4q1j8mlHSL6otbauiEy7yZrNTkbtnAXinYvrBp2sm4=";
      };
    };
  });
  meta = {
    description = "Messages that contain GeoPackage maps";
  };
})
