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
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."zenoh_security_tools";
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ rcutils rmw rmw-security-common tinyxml2-vendor zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zenoh_security_tools" = substituteSource {
      src = fetchgit {
        name = "zenoh_security_tools-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "512128e507ec8e95998f3fdebd585bf399ea950f";
        hash = "sha256-PJi00GJ3xtFCYvV2ogFtoxj92dHrFpGX7FPLba82U04=";
      };
    };
  });
  meta = {
    description = "This package generates config files to enforce security with Zenoh";
  };
})
