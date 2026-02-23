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
  version = "2.5.0-1";
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
        rev = "e92c46f7303c2184b4e60a6cc1d03a84491814d5";
        hash = "sha256-vHjk0NM/rPXp6DDQwJZrmjQu4aj95OFUu5VORdqZJL4=";
      };
    };
  });
  meta = {
    description = "RawDataSource from live or offline video sources";
  };
})
