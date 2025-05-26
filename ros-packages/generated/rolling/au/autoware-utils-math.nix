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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_math";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_math";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_math" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_math-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "0bbed896c0ce26f407dc9eca9be356a91727f08d";
        hash = "sha256-haEXAeYMe1QqwakxjHFVJ5WHFztApDZUQw8K/BZJQr8=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_math package";
  };
})
