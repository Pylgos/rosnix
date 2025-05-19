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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."autoware_utils_uuid";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_uuid" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_uuid-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "cedee40704a1f7c13b9bc9e23e3da6c50cdffeca";
        hash = "sha256-6afjh6354QdITHBkEOSzB+TTpAkTsSj4xxf5GJnYaW0=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_uuid package";
  };
})
