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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_input_rawlog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libobs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_input_rawlog" = substituteSource {
        src = fetchgit {
          name = "mola_input_rawlog-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "c4995be24272ea47ee9665fe770a5b71342ca147";
          hash = "sha256-RLCjzI60WiKzFpl7CS40eS67r8PLFiDClpti5YmjtlU=";
        };
      };
    });
  };
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
})
