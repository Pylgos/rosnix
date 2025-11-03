{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libhwdrivers,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_video";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."mola_input_video";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-kernel mrpt-libhwdrivers mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libhwdrivers mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_video" = substituteSource {
      src = fetchgit {
        name = "mola_input_video-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "dfe652b230fc741227f82f7bf23e0f9610afb448";
        hash = "sha256-kDLlA/V0wJZWn2ETPx8VTUtDQX/CcC4x1XlH3k0fcqk=";
      };
    };
  });
  meta = {
    description = "RawDataSource from live or offline video sources";
  };
})
