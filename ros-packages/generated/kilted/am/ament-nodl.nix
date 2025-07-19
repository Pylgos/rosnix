{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_nodl";
  version = "0.1.0-7";
  src = finalAttrs.passthru.sources."ament_nodl";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_nodl" = substituteSource {
      src = fetchgit {
        name = "ament_nodl-source";
        url = "https://github.com/ros2-gbp/ament_nodl-release.git";
        rev = "a6e29971e23c37f8b06185d3c8b12227845fb0b1";
        hash = "sha256-9azhFZrnSaHJiIRFdPiDTiDO3j2v3eKxQBNdAEFwd5A=";
      };
    };
  });
  meta = {
    description = "Ament extension for exporting NoDL .xml files";
  };
})
