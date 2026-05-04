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
  version = "7.10.1-4";
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
        rev = "3fb672776049c035b68cfb0b075f9e371241cb0d";
        hash = "sha256-c5yRsbfM6B56PnYtSiQgoQtGw6eycb1i7kBLTPsI/Uk=";
      };
    };
  });
  meta = {
    description = "Define a common rmw secutiry utils";
  };
})
