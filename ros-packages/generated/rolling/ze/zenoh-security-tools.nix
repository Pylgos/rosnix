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
  version = "0.10.2-1";
  src = finalAttrs.passthru.sources."zenoh_security_tools";
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zenoh_security_tools" = substituteSource {
      src = fetchgit {
        name = "zenoh_security_tools-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "04bd8a7da90a4ac73110124eb15b08d03d6d01cd";
        hash = "sha256-D9ow47u+bJZh1RIV0zYMkkC3V/pfTc2XjasDQau8OIw=";
      };
    };
  });
  meta = {
    description = "This package generates config files to enforce security with Zenoh";
  };
})
