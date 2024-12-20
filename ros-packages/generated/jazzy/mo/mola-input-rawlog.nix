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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rawlog" = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "7fd34789bbe08024fd5a694f571b3a4c07c59e25";
        hash = "sha256-GUgEAC55GhIxWkbmOjj0/W/67g4nMBUK5uFfr1nBBJU=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
