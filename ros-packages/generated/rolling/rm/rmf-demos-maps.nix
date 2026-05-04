{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-tools,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos_maps";
  version = "2.8.2-3";
  src = finalAttrs.passthru.sources."rmf_demos_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_maps-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "94f89e1b68a1545969681ee51d362095051ee3d1";
        hash = "sha256-ViOGodrxPAbUCIFdyWNQWopvEoHKimQcDbGFCp0d9W8=";
      };
    };
  });
  meta = {
    description = "A package containing demo maps for rmf";
  };
})
