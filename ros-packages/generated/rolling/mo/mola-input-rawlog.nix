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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rawlog" = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ef3305ff8e7edd91dc29e3b4d9561180fa92875c";
        hash = "sha256-9Pmftr8OQX3A1zmEGcgKkabsQleEswSWAmU/ynPjx6U=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
