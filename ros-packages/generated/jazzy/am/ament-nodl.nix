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
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_nodl" = substituteSource {
      src = fetchgit {
        name = "ament_nodl-source";
        url = "https://github.com/ros2-gbp/ament_nodl-release.git";
        rev = "87296f88baceaac5b561ecdd0e95240673ea8044";
        hash = "sha256-9azhFZrnSaHJiIRFdPiDTiDO3j2v3eKxQBNdAEFwd5A=";
      };
    };
  });
  meta = {
    description = "Ament extension for exporting NoDL .xml files";
  };
})
