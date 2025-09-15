{
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-security-common,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  zenoh-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zenoh_security_tools";
  version = "0.6.4-1";
  src = finalAttrs.passthru.sources."zenoh_security_tools";
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rmw-security-common tinyxml2-vendor zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-security-common tinyxml2-vendor zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zenoh_security_tools" = substituteSource {
      src = fetchgit {
        name = "zenoh_security_tools-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "b1d2c677db85772445fedb8f569ef2b6d9546995";
        hash = "sha256-LJdoLOU04Kl20pS9MLHOx4J2NFS11EVbaeewy3hTrH8=";
      };
    };
  });
  meta = {
    description = "This package generates config files to enforce security with Zenoh";
  };
})
