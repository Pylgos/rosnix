{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_geo_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_geo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geo_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geo_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "21b9f97c70fc86cf244d71ccabbb0e51750912df";
        hash = "sha256-XISamLBdcchShE1A+9bhQ1HfDx2xQjyo3Me+6uqFFrA=";
      };
    };
  });
  meta = {
    description = "The tuw_geo_msgs package";
  };
})
