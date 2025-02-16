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
  version = "7.7.0-1";
  src = finalAttrs.passthru.sources."rmw_security_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcutils rmw ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_security_common" = substituteSource {
      src = fetchgit {
        name = "rmw_security_common-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "0d0d066c8253fea801bce27e42c434ff96e8ed7a";
        hash = "sha256-4Kibe5gdJ0woW95NHozAL25ZPapWFIwlDq/COBCvylE=";
      };
    };
  });
  meta = {
    description = "Define a common rmw secutiry utils";
  };
})
