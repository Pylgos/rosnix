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
  version = "7.9.1-1";
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
        rev = "28899ab21cbadafd64b0337185773d4c7a70bb2a";
        hash = "sha256-W9ylKZKcc8DQudq6Y17hHTRVFx+yCuJqYwTHXcLSlLc=";
      };
    };
  });
  meta = {
    description = "Define a common rmw secutiry utils";
  };
})
