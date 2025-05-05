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
  version = "3.4.1-1";
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
        rev = "c5e8e7fa501a0ed2ff6fb3c05c17d83599dd80a4";
        hash = "sha256-XsqL6g2V+TJCo72yDQRUf95fmm2hEl4gYrBIGlvvLRo=";
      };
    };
  });
  meta = {
    description = "Messages that contain GeoPackage maps";
  };
})
