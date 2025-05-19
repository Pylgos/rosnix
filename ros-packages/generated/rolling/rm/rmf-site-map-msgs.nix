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
  version = "3.5.0-1";
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
        rev = "61329240e88056ee18236a4c41dd0ff316ba6157";
        hash = "sha256-EL03LqS+A+Z5xkt09Ej6gFsZAjnKYQ/52EjlB5qwbCA=";
      };
    };
  });
  meta = {
    description = "Messages that contain GeoPackage maps";
  };
})
