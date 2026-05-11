{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-core-api,
  autoware-core-control,
  autoware-core-localization,
  autoware-core-map,
  autoware-core-perception,
  autoware-core-planning,
  autoware-core-sensing,
  autoware-core-vehicle,
  autoware-global-parameter-loader,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_core";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ autoware-core-api autoware-core-control autoware-core-localization autoware-core-map autoware-core-perception autoware-core-planning autoware-core-sensing autoware-core-vehicle autoware-global-parameter-loader rviz2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-core-api autoware-core-control autoware-core-localization autoware-core-map autoware-core-perception autoware-core-planning autoware-core-sensing autoware-core-vehicle autoware-global-parameter-loader rviz2 ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core" = substituteSource {
      src = fetchgit {
        name = "autoware_core-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a24a3d19dd4046888a32ea73c262e3cbfa916f51";
        hash = "sha256-1kabTnMWfMjd8p/YJFuW9EzgVQ9p/DyAUVlH4O1UCoY=";
      };
    };
  });
  meta = {
    description = "The autoware_core package";
  };
})
