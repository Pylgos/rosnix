{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_security_common";
  version = "7.11.0-1";
  src = finalAttrs.passthru.sources."rmw_security_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcutils rmw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcutils rmw ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_security_common" = substituteSource {
      src = fetchgit {
        name = "rmw_security_common-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "0e56aeb265e971d8b96b095954caea80230bdc88";
        hash = "sha256-MiGqL0qJU4IvcIQtGeoW8R+uU1oR0SjpIMTl9EH/ZQI=";
      };
    };
  });
  meta = {
    description = "Define a common rmw secutiry utils";
  };
})
