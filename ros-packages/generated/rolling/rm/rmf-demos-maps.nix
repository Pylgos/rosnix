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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_maps-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "d43f59f766fec5a3caaae9c43bd8d17a1818045b";
        hash = "sha256-KDzC3Xa6OgQzDzxj4x7zm9bm+zT5OqRYE+4orH7Q1yo=";
      };
    };
  });
  meta = {
    description = "A package containing demo maps for rmf";
  };
})
