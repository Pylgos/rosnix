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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."urdf_parser_plugin";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ urdfdom-headers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_parser_plugin" = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "b20790605b723175c249ab84a09d9b779faa403e";
        hash = "sha256-EReGZbzH5Tz/mY6RFjNEfavtZ+JpL+PW5EDfvFg05Ac=";
      };
    };
  });
  meta = {
    description = "This package contains a C++ base class for URDF parsers.";
  };
})
