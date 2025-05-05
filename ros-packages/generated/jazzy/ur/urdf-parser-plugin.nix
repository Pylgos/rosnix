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
  version = "2.10.0-3";
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
        rev = "dad3497e5da0adf790e330ba745819f2f34c79b1";
        hash = "sha256-GCrcxy4++BTlYYQe+5+6IfQLfmKX/BCNMCgdYQ4Ttd4=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a C++ base class for URDF parsers.\n  ";
  };
})
