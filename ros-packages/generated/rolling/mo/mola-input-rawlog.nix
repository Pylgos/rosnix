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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rawlog" = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "73a9a66b04d8c81f90bf349b280a6bdfc879630d";
        hash = "sha256-Obf8nfz5hSt2R9OlU2/rEeSINy1wpALeeh/OgqZ9mLU=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
