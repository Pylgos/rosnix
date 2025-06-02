{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_msgs";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."dwb_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-2d-msgs nav-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-2d-msgs nav-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_msgs" = substituteSource {
      src = fetchgit {
        name = "dwb_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e3ecbab0ae3a8390ca0eaddef7e7cacce83ee047";
        hash = "sha256-Qb4Je29J1Zm1xgakofhXG4UlxN4M9fe5YE5EY6BgTGM=";
      };
    };
  });
  meta = {
    description = "Message/Service definitions specifically for the dwb_core";
  };
})
