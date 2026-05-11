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
  rmw-security-common,
  rosSystemPackages,
  substituteSource,
  zenoh-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zenoh_security_tools";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."zenoh_security_tools";
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  propagatedBuildInputs = [ rcpputils rcutils rmw-security-common zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "tinyxml2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zenoh_security_tools" = substituteSource {
      src = fetchgit {
        name = "zenoh_security_tools-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "84a9b4931a0ec7eca189062562ca13b039adb524";
        hash = "sha256-Ycm6ebURCq6hbA/3vV3foQh7wxwT9Bj/5fqerOcl8jQ=";
      };
    };
  });
  meta = {
    description = "This package generates config files to enforce security with Zenoh";
  };
})
