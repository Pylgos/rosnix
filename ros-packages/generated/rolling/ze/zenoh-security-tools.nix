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
  zenoh-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zenoh_security_tools";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."zenoh_security_tools";
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zenoh_security_tools" = substituteSource {
      src = fetchgit {
        name = "zenoh_security_tools-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "b748db4fb6de354c860350c9e2a9b3abb795b1ba";
        hash = "sha256-pGDMVELOBh9YIuaxbDrkCuqqbPIdUvYVNk1sLfB8++w=";
      };
    };
  });
  meta = {
    description = "This package generates config files to enforce security with Zenoh";
  };
})
