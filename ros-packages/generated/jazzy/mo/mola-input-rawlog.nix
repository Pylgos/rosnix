{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_rawlog";
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rawlog" = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ee6cdfa53fa98fe63df79a6c0fa0a69f607dc507";
        hash = "sha256-D9sacMww/c4qdO8IqPOz61NFAD7ddJsIJUEX30UKASI=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
