{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_uuid";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_utils_uuid";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_uuid" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_uuid-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "63e98b5185b82e05b3b31f47e689025d86eef20f";
        hash = "sha256-FesiNGqLkR1Qav3KHXuP1345W8TeO3IiJsl0CSyIbuA=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_uuid package";
  };
})
