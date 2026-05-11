{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_parser_plugin";
  version = "2.14.0-1";
  src = finalAttrs.passthru.sources."urdf_parser_plugin";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ urdfdom-headers ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ urdfdom-headers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_parser_plugin" = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "93ec62635a263709fdfe326de3b6d4890caedb1a";
        hash = "sha256-TVvzZQIXlYhNV2ghyUXP0sTEeMU8XSCoY8Tj4WMWRMU=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a C++ base class for URDF parsers.\n  ";
  };
})
