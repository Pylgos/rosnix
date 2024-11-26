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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."urdf_parser_plugin";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ urdfdom-headers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_parser_plugin" = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "dad41adcdb0eb1dabc8a2ff43909f5107bc3e37e";
        hash = "sha256-jak4nCNAsPorAcfxqx1lqsktcFckTz78KrgpZ0ZN9ss=";
      };
    };
  });
  meta = {
    description = "This package contains a C++ base class for URDF parsers.";
  };
})
